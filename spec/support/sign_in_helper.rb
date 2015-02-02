module SignInHelpers
  def sign_in(user)
    visit sign_in_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button "Sign in"
  end

  def invalid_sign_in_flash
    expect(page).to have_text "Bad email or password."
  end
end

RSpec.configure do |config|
  config.include SignInHelpers
end
