require 'rails_helper'

# Feature: Log in
#   New users (pending) and active users can log in
feature 'Log In Log Out' do

  before do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Log In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'user can log in with valid email address and password' do
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'user can log in then log out' do
    expect(page).to have_content 'Signed in successfully.'
    click_link 'Sign Out'
    expect(page).to have_content 'Signed out successfully'
  end

end