require 'rails_helper'
feature "User signs up for acount" do 
  scenario "successfuly" do
    sign_up("standard@example.com", "helloworld")
    expect(page).to have_text("Welcome! You have signed up successfully.")
    expect(unread_emails_for(User.first.email).count).to eq(1)
    open_email(User.first.email)
    expect(current_email).to have_body_text("You can confirm your account email through the link below")
    click_first_link_in_email
    expect(page).to have_content('Your email address has been successfully confirmed')
  end  
end