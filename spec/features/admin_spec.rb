require 'rails_helper'

feature 'Admin Area' do

  before do
    @user = FactoryGirl.create(:user)
  end

  # Scenario: admin user can access users index page and see Edit link
  scenario 'admin user can access users' do
    admin = FactoryGirl.create(:admin)
    login_as(admin, scope: :user)
    visit root_path
    click_link 'Manage Users'
    expect(page).to have_content @user.name
    expect(page).to have_content 'Community'
    expect(page).to have_link("Edit")
  end

  # Scenario: support user can access users index page but have no Edit link
  scenario 'support user can access users' do
    admin = FactoryGirl.create(:support)
    login_as(admin, scope: :user)
    visit root_path
    click_link 'Manage Users'
    expect(page).to have_content @user.name
    expect(page).to have_content 'Community'
    expect(page).to have_no_link("Edit")
  end

  # Scenario: community user cannot access users index page
  scenario 'admin user can access users' do
    login_as(@user, scope: :user)
    visit users_path
    expect(page).to have_content 'You do not have access to that part of AscensionTest'
  end

  # Scenario: admin user can edit a user's role
  scenario 'admin user can edit user role' do
    admin = FactoryGirl.create(:admin)
    login_as(admin, scope: :user)
    visit edit_user_path(@user)
    choose 'support'
    click_button 'Update User'
    expect(page).to have_content 'User was successfully updated.'
  end

  # Scenario: admin user cannot edit themselves
  scenario 'admin user can edit user role' do
    admin = FactoryGirl.create(:admin)
    login_as(admin, scope: :user)
    visit edit_user_path(admin)
    expect(page).to have_content 'You do not have access to that part of AscensionTest'
  end

  # Scenario: support user cannot access edit user via url
  scenario 'admin user can edit user role' do
    support = FactoryGirl.create(:support)
    login_as(support, scope: :user)
    visit edit_user_path(@user)
    expect(page).to have_content 'You do not have access to that part of AscensionTest'
  end

end