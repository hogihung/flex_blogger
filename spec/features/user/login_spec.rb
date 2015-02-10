require "rails_helper"

	feature "User logs into site" do

		given(:user) { create :user }

		scenario "user logs in" do
			sign_in(user)

			expect(page).to have_link "Admin"
		end

		scenario "user logs out" do
			sign_in(user)
			sign_out

			expect(page).to_not have_link "Admin"
		end
end
