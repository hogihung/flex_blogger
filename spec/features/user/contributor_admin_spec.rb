require "rails_helper"

feature "Managing user resource" do

  given(:user)       { create :user }
  given(:contrib_one) { create :contributor_one }
  given(:contrib_two) { create :contributor_two }

  scenario "Admin can list all registered users" do
    contrib_one
    contrib_two

    manage_contributor

    expect(page).to have_content "Listing Users"
    expect(page).to have_content "user@example.com"
    expect(page).to have_content "jack@example.com"
    expect(page).to have_content "jill@example.com"
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

  scenario "A non-admin should not be able to access user admin resource." do
    sign_in(contrib_one)

    visit root_path
    click_link "Admin"

    expect(page).to_not have_link "Contributors"
  end

  scenario "A non-admin should not be able to access user admin resource directly." do
    sign_in(contrib_one)

    visit "/users"

    expect(page).to have_content "Not Authorized"
  end

  # scenario "A non-admin should not be able to edit a user admin resource directly." do
  #   user
  #   sign_in(contrib_two)

  #   visit "/users/1/edit"

  #   expect(page).to have_content "Not Authorized"
  # end

  scenario "A visitor should not be able to access user admin resource directly. " do
    visit "/users"
    expect(page).to have_content "Not Authorized"
  end


  def manage_contributor
    sign_in(user)
    visit root_path
    click_link "Admin"
    click_link "Contributors"
  end
end
