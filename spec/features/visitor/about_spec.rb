require "rails_helper"

feature "Viewing About Page" do
  scenario "a visitor clicks on the about link" do
    visit root_path

    find(:css, "#js-navigation-menu > li:nth-child(2) > a").click

    expect(page).to have_content "About Me"
    expect(page).to have_content "What is this site all about?"
    expect(page).to have_content "details that a new person is"
    expect(page).to have_content "One of my goals is to pass on"
  end
end
