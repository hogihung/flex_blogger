require 'rails_helper'

feature 'Managing Posts' do
  scenario 'Create a new post' do
    visit new_post_path

    fill_in 'post_title', with: 'Title'
    fill_in 'post_body',  with: 'Body'
    click_button 'Create Post'

    expect(page).to have_content 'Successfully created'
  end

  scenario 'Edit a post' do
    @post = FactoryGirl.create(:post)
    visit edit_post_path(@post)

    fill_in 'post_body', with: 'Bodies'
    click_button 'Update Post'

    expect(page).to have_content 'Successfully updated'
  end

  scenario 'Delete a post' do
    @post = FactoryGirl.create(:post)
    visit posts_path

    click_link 'Delete'

    expect(page).to have_content 'Successfully deleted'
  end
end