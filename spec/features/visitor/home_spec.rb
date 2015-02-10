require "rails_helper"

feature "Viewing Home Page" do
  scenario "a visitor visits the home page (root url)" do
    visit root_path

    expect(page).to have_content "My Cool Blog Name Here"
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
end
