require 'rails_helper'
feature "user created todo" do 
  scenario "successfully" do
    visit('/todos')
    expect(current_path).to eq(new_user_session_path)
    sign_up("standard@example.com", "helloworld")
    visit('/todos')
    fill_in 'description', with: 'clean house'
    click_button 'save'
    expect(page).to have_content('Item was saved')
    expect(page).to have_content('clean house')
  end
end