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
end
