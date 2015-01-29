require 'rails_helper'

feature 'Viewing Home Page' do
  scenario 'a visitor clicks on the about link' do
   	visit root_path

		click_link 'Home'
		
		expect(page).to have_content 'The Home Page'
	end
end
