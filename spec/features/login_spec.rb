require 'rails_helper'

feature 'User logs into site' do
	background do
		@user = User.new(email: '444c43@gmail.com', password: 'unity8277')
		@user.save
	end

	scenario 'user logs in' do
   	visit root_path
		click_link 'Sign In'
		
		fill_in 'session_email',  with: '444c43@gmail.com'
		fill_in 'session_password',  with: 'unity8277'

		click_button 'Sign in'

		expect(page).to have_link 'Admin'
	end

	scenario 'user logs out' do
   	visit root_path
		click_link 'Sign In'
		
		fill_in 'session_email',  with: '444c43@gmail.com'
		fill_in 'session_password',  with: 'unity8277'

		click_button 'Sign in'
		click_link 'Admin'
		click_link 'Sign Out'

		expect(page).to have_link 'Sign In'
	end
end
