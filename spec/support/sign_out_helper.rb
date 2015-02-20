module SignOutHelpers
  def sign_out
    click_link "Manage"
    click_link "Sign Out"
  end
end

RSpec.configure do |config|
  config.include SignOutHelpers
end
