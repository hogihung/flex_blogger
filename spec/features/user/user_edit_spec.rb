require "rails_helper"

feature "Edit user settings," do

  given(:user)         { create :user }
  given(:contrib_one)  { create :contributor_one }
  given(:contrib_two)  { create :contributor_two }
  given(:post)         { create :post }

  scenario "A user can change their own password" do
    post
    sign_in(contrib_one)

    click_link "Manage"
    click_link contrib_one.display_name
    fill_in "Password", with: "a_newPassword"
    click_on "Update User"

    expect(page).to have_content "Update successful!"
    expect(page).to have_content "Your Awesome Blog Name Goes Here"
    expect(page).to have_content "Blog Post Title Here"
  end

end

