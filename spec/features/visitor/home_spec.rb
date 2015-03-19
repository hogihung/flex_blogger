require "rails_helper"

feature "Viewing Home Page" do
  scenario "a visitor visits the home page (root url)" do
    create_sample_posts

    visit root_path

    expect(page).to have_content "Your Awesome Blog Name Goes Here"

    expect_to_see_post_listing_for post
    expect_to_see_post_listing_for blog
    expect_to_see_post_listing_for ssh
  end

  scenario "a visitor should not see admin menu" do
    visit root_path

    expect(page).to_not have_link "Admin"
  end

  scenario "a visitor should not see a sign in link" do
    visit root_path

    expect(page).to_not have_link "Sign In"
  end

  scenario "a visitor clicks link for a blog entry to see more" do
    post = create(:ssh)
    visit root_path
    click_link "Passwordless login with ssh"

    expect(page).to_not have_content "Not Authorized"
    expect(page).to have_text ssh.title
    expect(page).to have_text ssh.author.display_name

    editor_post = create(:editor_post, post: post)
    expect(page).not_to have_been_edited_per? editor_post

    visit post_path(post.id)

    expect(page).to have_been_edited_per? editor_post
    expect(page).to have_text post.updated_at.strftime("%B %d, %Y")
  end

  scenario "a visitor uses the search feature in the nav bar." do
    create_sample_posts
    visit root_path

    fill_in "query", with: "women less"
    find("#search-query").click

    expect(page).to have_content "A frequent topic that surfaces"
    expect(page).to_not have_content "To be able to login"
    expect(page).to_not have_content "Web development, and programming"
  end

  scenario "a visitor sees previous post links in sidebar." do
    create_all_posts
    visit root_path

    expect(page).to have_content "Why are women paid less"
    expect(page).to_not have_content "Aint Your Ruby"
    expect(page).to have_content "Enable Remote Access "
    expect(page).to have_content "Borrowing From Ruby Tapas "
  end

  scenario "a visitor clicks on flex logo to return to root page." do
    create_sample_posts
    visit root_path

    click_link "Why are women paid less"
    expect(page).to have_content "A frequent topic that surfaces"

    find(".logo").click
    expect(page).to have_content "How To Install Rails 2.0"
  end

  scenario "a visitor should not see posts with a status of draft" do
    create_sample_posts
    create(:draft)
    visit root_path

    expect(page).to have_text "A frequent topic that surfaces"
    expect(page).to_not have_text "Aint Your Ruby"
  end

  scenario "a visitor should not see draft posts when they use search", :focus do
    create_all_posts
    visit root_path

    fill_in "query", with: "Aint Your Ruby"
    find("#search-query").click

    expect(page).to have_text "Recent Posts"
    expect(page).to have_text "No Records Found."
    expect(page).to_not have_text "When meeting new people in the programming community"
  end

  given(:post) { create :post }
  given(:ssh) { create :ssh }
  given(:blog) { create :blog }

  def create_sample_posts
    post; ssh; blog
    create(:women)
    create(:retired)
  end

  def create_all_posts
    create_sample_posts
    create(:draft)
    create(:deploy_error)
    create(:test_suite)
    create(:gathering)
    create(:postgres_remote)
    create(:ssh_access)
    create(:chruby)
    create(:tapas)
  end

  def expect_to_see_post_listing_for(a_post)
    expect(page).to have_content a_post.title
    expect(page).to have_content a_post.author.display_name
    expect(page).to have_content a_post.created_at.strftime("%B %d, %Y")
  end

  def have_been_edited_per?(editor_post)
    have_text "Last Edited by: #{editor_post.editor.display_name}"
  end
end
