require "rails_helper"

feature "Viewing Contact Page" do
  scenario "a visitor clicks on contacts link" do
    visit root_path

    find(:css, "#js-navigation-menu > li:nth-child(3) > a").click

    expect(page).to have_content "Contact Us"
  end
end
