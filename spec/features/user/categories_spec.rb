require "rails_helper"

feature "Managing Categories" do

  given(:user)         { create :user }
  given(:category)     { create :category }
  given(:collaborator) { create :collab_user_one }

  scenario "Visit Category page" do
    sign_in(user)

    click_link "Admin"
    click_link "Categories"

    expect(page).to have_content "Listing categories"
  end

  scenario "Create a new category" do
    sign_in(user)

    visit new_category_path
    fill_in "category_description", with: "Politics"
    click_button "Create Category"

    expect(page).to have_content "Successfully created"
  end

  scenario "Edit a category" do
    sign_in(user)

    visit edit_category_path(category)
    fill_in "category_description", with: "Political Culture"
    click_button "Update Category"

    expect(page).to have_content "Successfully updated"
  end

  scenario "Delete a category" do
    sign_in(user)
    create(:category)

    visit categories_path
    click_link "Delete"

    expect(page).to have_content "Successfully deleted"
  end

  scenario "Collaborator not able to delete a category" do
    sign_in(collaborator)
    create(:category)

    visit categories_path

    expect(page).to_not have_link "Delete"
  end
end
