require "rails_helper"

feature "Visitors should not be able to access category resource." do
  scenario "Trying to access category index" do
    visit categories_path

    expect(page).to have_content "Not Authorized"
  end

  scenario "Trying to access new category path", focus: true do
    visit new_category_path

    expect(page).to have_content "Not Authorized"
  end

  scenario "Trying to edit a category directly", focus: true do
    create(:category)

    visit "/categories/1/edit"

    expect(page).to have_content "Not Authorized"
  end
end

