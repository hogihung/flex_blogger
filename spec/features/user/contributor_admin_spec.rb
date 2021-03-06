require "rails_helper"

feature "Managing user resource" do

  given(:user)       { create :user }
  given(:contrib_one) { create :contributor_one }
  given(:contrib_two) { create :contributor_two }

  scenario "Admin can list all registered users" do
    contrib_one
    contrib_two

    manage_contributor

    expect(page).to have_content "Manage Users"
    expect(page).to have_content user.email
    expect(page).to have_content contrib_one.email
    expect(page).to have_content contrib_two.email
  end

  scenario "Admin can add a contributor" do
    manage_contributor

    click_link "New"
    fill_in "Email", with: "bobo@example.com"
    fill_in "Password", with: "mysillyPasswd"
    click_button "Sign up"

    expect(page).to have_content "Contributor created successfully."
    expect(page).to have_content "bobo@example.com"
  end

  scenario "Admin can edit a contributor and make them an admin." do
    contrib_one

    manage_contributor

    find(:xpath, "//tr[contains(.,'jack')]/td/a", text: "Edit").click
    check("Admin")
    click_button "Update User"

    expect(page).to has_updated_successfully?
    expect(page).to have_xpath("//tr[contains(.,'jack')][contains(.,'true')]")
  end

  scenario "Admin can change the password for another user." do
    contrib_one

    manage_contributor

    find(:xpath, "//tr[contains(.,'jack')]/td/a", text: "Edit").click
    fill_in "Password", with: "nopwdReqd"
    click_button "Update User"

    expect(page).to has_updated_successfully?

    sign_out
    sign_in_user_with_password_changed
  end

  scenario "Admin can change display_name for another user." do
    contrib_one

    manage_contributor

    find(:xpath, "//tr[contains(.,'jack')]/td/a", text: "Edit").click
    fill_in "Display name", with: "Mr. Magoo"
    click_button "Update User"

    expect(page).to has_updated_successfully?
    expect(page).to have_content "Mr. Magoo"
  end

  def has_updated_successfully?
    have_content "Update successful!"
  end

  scenario "Admin can delete a contributor." do
    contrib_one

    manage_contributor
    find(:xpath, "//tr[contains(.,'jack')]/td/a", text: "Delete").click

    expect(page).to have_content "Contributor removed successfully."
  end

  scenario "Users that are admin true should not display delete link" do
    contrib_one
    contrib_two

    manage_contributor

    expect(page).to have_xpath("//tr[contains(.,'jack')][contains(.,'Delete')]")
    expect(page).to_not have_xpath("//tr[contains(.,'user')][contains(.,'Delete')]")
  end

  scenario "A non-admin should not be able to access user admin resource." do
    sign_in(contrib_one)

    visit root_path
    click_link "Manage"

    expect(page).to_not have_link "Contributors"
  end

  scenario "A non-admin should not be able to access user admin resource directly." do
    sign_in(contrib_one)

    visit "/users"

    expect(page).to have_content "Not Authorized"
  end

   scenario "A non-admin should not be able to edit a user admin resource directly." do
     sign_in(contrib_two)

     visit "/users/#{user.id}/edit"

     expect(page).to have_content "Not Authorized"
   end

  scenario "A visitor should not be able to access user admin resource directly. " do
    visit "/users"
    expect(page).to have_content "Not Authorized"
  end


  def manage_contributor
    sign_in(user)
    visit root_path
    click_link "Manage"
    click_link "Contributors"
  end

  def sign_in_user_with_password_changed
    visit sign_in_path
    fill_in "session_email", with: "jack@example.com"
    fill_in "session_password", with: "nopwdReqd"
    click_button "Sign in"

    expect(page).to have_link "Manage"
  end

end
