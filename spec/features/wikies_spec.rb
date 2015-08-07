require 'rails_helper'
feature 'Standard user' do
  before do
    @wiki = create(:wiky)
    @standard_user = create(:user)
    sign_in(@standard_user.email, @standard_user.password)
    @wiky = create(:wiky, user: @standard_user, title: "Valid Title")
    @collaboration = Collaboration.create(user: @standard_user, wiky: @wiky)
  end
  scenario "Standard user views wikies index" do  
    visit wikies_path
    expect(page).to have_text(@wiky.title)
    expect(page).to have_text(@wiky.body)
  end

  scenario "user visits private wiky" do 
    @standard_user.reload
    visit(privatewikies_path)
    expect(page).to have_content("Private Wikies")
  end

  scenario "standard user can see wikies he/she can collaborate on" do 
    visit('/privatewikies')
    expect(page).to have_content(@wiky.reload.title)
    puts current_path
  end

  scenario "standard user visits Wiky show" do 
    visit('/wiky/#{@wiky.id}')
    expect(page).to have_text(@wiky.user)
    expect(page).to have_text(@wiky.collaboration.user)
  end
  
  scenario "standard user edits a wiky" do 
    visit('/')
  end
end
