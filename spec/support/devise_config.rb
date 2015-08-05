# Manual Sign in and sign up for feature specs 
module Features
  module SessionHelpers
    def sign_up(email, password)
      visit new_user_registration_path
      fill_in 'sign_up_email', with: email
      fill_in 'sign_up_user_password', with: password
      fill_in 'sign_up_user_password_confirmation', with: password
      click_button 'Submit'
    end

    def sign_in(email, password)
      visit new_user_session_path
      fill_in 'sign_in_email', with: email
      fill_in 'sign_in_user_password', with: password
      click_button 'Log in'
    end
  end
end

RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
end