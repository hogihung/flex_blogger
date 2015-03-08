require "rails_helper"

feature "Managing Posts" do
  given(:user) { create :user }
  given(:post) { create :post }
  given(:category_ruby) { create :ruby }
  given(:category_javascript) { create :javascript }

  scenario "Create a new post" do
    category_ruby
    category_javascript

    sign_in(user)
    visit new_post_path

    fill_in "post_title", with: "Title"
    fill_in "post_body",  with: "Body"
    select "Ruby", from: "post_category"
    select "draft", from: "post_status"
    click_button "Create Post"

    expect(page).to have_content "Successfully created"
  end

  scenario "Edit a post" do
    sign_in(user)
    visit edit_post_path(post)

    fill_in "post_body", with: "Bodies"
    click_button "Update Post"

    expect(page).to have_content "Successfully updated"
  end

  scenario "Delete a post" do
    create(:post)

    sign_in(user)
    visit posts_path

    click_link "Delete"

    expect(page).to have_content "Successfully deleted"
  end

  given(:list_of_posts) { create_list :post, 3 }
  scenario "View listing of existing Posts" do
    list_of_posts
    visit posts_path(as: user)
    within("table.tables") do
      list_of_posts.each do |post|
        expect(page).to have_text post.title
        expect(page).to have_text post.author.display_name
      end
    end
  end

  scenario "Display Lasted Edited display_name" +
    " for post that have been edited." do
    create :editor_post, post: post, editor: user

    visit posts_path(as: user)

    within(".last-edited-by") do
      expect(page).to have_text user.display_name
    end
  end
end
