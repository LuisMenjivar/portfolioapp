require 'rails_helper'
feature 'Standard user' do
  before do
    @wiki = create(:wiky)
    @standard_user = create(:user)
    sign_in(@standard_user.email, @standard_user.password)
    @wiki = create(:wiky, user: @standard_user, title: "Valid Title")
  end
  scenario "Standard user views wikies index" do  
    visit wikies_path
    expect(page).to have_text(@wiki.title)
    expect(page).to have_text(@wiki.body)
  end
end