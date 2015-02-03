require "rails_helper"

feature "Viewing About Page" do
  scenario "a visitor clicks on the about link" do
    visit root_path

    click_link "About"

    expect(page).to have_content "The About Page"
  end
end
