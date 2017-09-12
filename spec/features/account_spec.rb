require 'rails_helper'

feature 'Edit Account' do

  # Scenario: Logged in user changes email address successfully
  #   User should see a account updated message
  scenario 'user changes email' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit edit_user_registration_path
    fill_in 'Email', with: 'mynewemail@test.com'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content 'Your account has been updated successfully.'
  end

  # Scenario: Logged in user changes email address w/o entering password
  #   User should see a account updated message
  scenario 'user attempts to change email without current password' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit edit_user_registration_path
    fill_in 'Email', with: 'mynewemail@test.com'
    click_button 'Update'
    expect(page).to have_content "can't be blank"
  end

  # Scenario: Logged in user can change password
  #   User should see a account updated message
  scenario 'user changes password' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit edit_user_registration_path
    fill_in 'Password', with: 'pass1122'
    fill_in 'Password confirmation', with: 'pass1122'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content 'Your account has been updated successfully.'
  end

  # Scenario: Logged in user cannot change password with mismatching password and password confirmation
  #   User should see a account updated message
  scenario 'user changes password' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit edit_user_registration_path
    fill_in 'Password', with: 'pass1122'
    fill_in 'Password confirmation', with: 'pass1128'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  # Scenario: Logged in user cannot change password without providing current password
  #   User should see a account updated message
  scenario 'user changes password' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit edit_user_registration_path
    fill_in 'Password', with: 'pass1122'
    fill_in 'Password confirmation', with: 'pass1128'
    click_button 'Update'
    expect(page).to have_content "we need your current password to confirm your changes"
  end

end