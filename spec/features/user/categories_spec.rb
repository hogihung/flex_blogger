require "rails_helper"

feature "Managing Categories," do

  given(:user)         { create :user }
  given(:category)     { create :category }
  given(:category_ruby) { create :ruby }
  given(:contrib_one)  { create :contributor_one }

  scenario "An Admin visits Category page" do
    category_ruby

    manage_category(user)

    expect(page).to have_content "Listing categories"
    expect(page).to have_content "Ruby"
  end

  scenario "A Contributor visits Category page" do
    category_ruby

    manage_category(contrib_one)

    expect(page).to have_content "Listing categories"
    expect(page).to have_content "Ruby"
  end

  scenario "An Admin creates a new category via manage menu" do
    manage_category(user)

    click_link "New Category"
    fill_in "category_description", with: "Politics"
    click_button "Create Category"

    expect(page).to have_content "Successfully created"
  end

  scenario "A Contributor should not see New Category link" do
    category

    manage_category(contrib_one)

    expect(page).to_not have_link "New Category"
  end

  scenario "An Admin creates a new category via category path" do
    sign_in(user)

    visit new_category_path
    fill_in "category_description", with: "Politics"
    click_button "Create Category"

    expect(page).to have_content "Successfully created"
  end

  scenario "A Contributor should not be able to create a category via direct path" do
    sign_in(contrib_one)

    visit new_category_path

    expect(page).to have_content "Not Authorized"
  end

  scenario "An Admin edits a category via manage menu" do
    category
    manage_category(user)

    click_link "Edit"
    fill_in "category_description", with: "Religion and Politics"
    click_button "Update Category"

    expect(page).to have_content "Successfully updated category"
  end

  scenario "A Contributor should not see edit link for categories" do
    category

    manage_category(contrib_one)

    expect(page).to_not have_link "Edit"
  end

  scenario "An Admin edits a category via category path" do
    sign_in(user)

    visit edit_category_path(category)
    fill_in "category_description", with: "Political Culture"
    click_button "Update Category"

    expect(page).to have_content "Successfully updated category"
  end

  scenario "A Contributor should not be able to edit a category via path" do
    sign_in(contrib_one)

    visit edit_category_path(category)

    expect(page).to have_content "Not Authorized"
  end

  scenario "An Admin deletes a category" do
    category
    sign_in(user)

    visit categories_path
    click_link "Delete"

    expect(page).to have_content "Successfully deleted"
  end

  scenario "Collaborator not able to delete a category" do
    category
    sign_in(contrib_one)

    visit categories_path

    expect(page).to_not have_link "Delete"
  end

  def manage_category(login)
    login_type = login
    sign_in(login_type)
    click_link "Manage"
    click_link "Categories"
  end
end
