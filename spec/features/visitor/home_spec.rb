require "rails_helper"

feature "Viewing Home Page" do
  scenario "a visitor visits the home page (root url)" do
    visit root_path

    expect(page).to have_content "Your Awesome Blog Name Goes Here"
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
    create(:ssh)
    visit root_path
    click_link "Passwordless login with ssh"

    expect(page).to_not have_content "Not Authorized"
    expect(page).to have_content "To be able to login to your remote over ssh"
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

  def create_sample_posts
    create(:post)
    create(:ssh)
    create(:blog)
    create(:draft)
    create(:retired)
  end

  def create_all_posts
    create_sample_posts
    create(:not_ruby)
    create(:deploy_error)
    create(:test_suite)
    create(:gathering)
    create(:postgres_remote)
    create(:ssh_access)
    create(:chruby)
    create(:tapas)
  end
end
