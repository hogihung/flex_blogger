require "rails_helper"

feature "Visitors should not be able to access post resource." do
  scenario "Trying to access post index" do
    visit posts_path

    expect(page).to have_content "Not Authorized"
  end

  scenario "Trying to access new post path" do
    visit new_post_path

    expect(page).to have_content "Not Authorized"
  end

  scenario "Trying to edit a post directly" do
    create(:post)

    visit "/posts/1/edit"

    expect(page).to have_content "Not Authorized"
  end
end
