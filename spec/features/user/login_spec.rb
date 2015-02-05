require "rails_helper"

feature "User logs into site" do
	background do
		@user = FactoryGirl.create(:user)
	end

	scenario "user logs in" do
		sign_in(@user)

		expect(page).to have_link "Admin"
	end

	scenario "user logs out" do
		sign_in(@user)

		sign_out

		expect(page).to have_link "Sign In"
	end
end
