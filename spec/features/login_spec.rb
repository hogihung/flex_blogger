require 'rails_helper'

feature 'User logs into site' do
	background do
		@user = User.new(email: 'user@gmail.com', password: 'password')
		@user.save
	end

	scenario 'user logs in' do
   	visit root_path
		click_link 'Sign In'
		
		fill_in 'session_email',  with: 'user@gmail.com'
		fill_in 'session_password',  with: 'password'

		click_button 'Sign in'

		expect(page).to have_link 'Admin'
	end

	scenario 'user logs out' do
   	visit root_path
		click_link 'Sign In'
		
		fill_in 'session_email',  with: 'user@gmail.com'
		fill_in 'session_password',  with: 'password'

		click_button 'Sign in'
		click_link 'Admin'
		click_link 'Sign Out'

		expect(page).to have_link 'Sign In'
	end
end
