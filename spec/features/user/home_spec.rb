require "rails_helper"

feature "Viewing Home Page" do
  scenario "a visitor clicks on the blog link" do
    visit root_path

    click_link "Blog"

    expect(page).to have_content "Your Awesome Blog Name Goes Here"
  end
end
