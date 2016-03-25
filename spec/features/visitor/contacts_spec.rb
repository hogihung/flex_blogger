require "rails_helper"

# added :js => true to assist in trouble shooting a failed test (on purpose)
# remove comments and the , :js => true when done.
feature "Viewing Contact Page", :js => true do
  scenario "a visitor clicks on contacts link" do
    visit root_path

    find(:css, "#js-navigation-menu > li:nth-child(3) > a").click

    expect(page).to have_content "Contact Us"
  end
end
