require 'rails_helper'

feature 'Managing Categories' do
  scenario 'Create a new category' do
    visit new_category_path

    fill_in 'category_description', with: 'Politics'
    click_button 'Create Category'

    expect(page).to have_content 'Successfully created'
  end

  scenario 'Edit a category' do
    @category = FactoryGirl.create(:category)
    visit edit_category_path(@category)

    fill_in 'category_description', with: 'Political Culture'
    click_button 'Update Category'

    expect(page).to have_content 'Successfully updated'
  end

  scenario 'Delete a category' do
    @category = FactoryGirl.create(:category)
    visit categories_path

    click_link 'Delete'

    expect(page).to have_content 'Successfully deleted'
  end
end