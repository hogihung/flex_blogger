require "rails_helper"

feature "Viewing Contact Page" do
  scenario "a visitor clicks on contacts link" do
    visit root_path

    click_link "Contact"

    expect(page).to have_content "Contact Us"
  end
end
