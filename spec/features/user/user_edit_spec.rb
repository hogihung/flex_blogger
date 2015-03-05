require "rails_helper"

feature "Edit user settings," do

  given(:user)         { create :user }
  given(:contrib_one)  { create :contributor_one }
  given(:contrib_two)  { create :contributor_two }
  given(:post)         { create :post }

  scenario "A user can change their own password" do
    user_updates_themself

    fill_in "Password", with: "a_newPassword"
    click_on "Update User"

    expected_result_on_update
  end

  scenario "A user can change their own display name" do
    user_updates_themself

    fill_in "Display name", with: "OdoRuff"
    click_on "Update User"

    expected_result_on_update
  end

  scenario "A non-admin should not be able to edit themself to become admin" do
    user_updates_themself
    expect(page).to_not have_content "Admin"
  end

  def user_updates_themself
    post
    sign_in(contrib_one)

    click_link "Manage"
    click_link contrib_one.display_name
  end

  def expected_result_on_update
    expect(page).to have_content "Update successful!"
    expect(page).to have_content "Your Awesome Blog Name Goes Here"
    expect(page).to have_content "Blog Post Title Here"
  end

end

