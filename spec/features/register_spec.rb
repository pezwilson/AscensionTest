require 'rails_helper'

# Feature: Sign up
#   As a visitor
#   I want to sign up
#   So I can visit protected areas of the site
feature 'Sign Up' do

  # Scenario: Visitor can sign up with valid email address and password
  #   Given I am not logged in
  #   When I sign up with a valid email address and password
  #   Then I see a successful sign up message
  scenario 'visitor can sign up with first name, last name, valid email address and password' do
    sign_up_with('Test','User','test@example.com', 'pass1234', 'pass1234')
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  ## Scenario: Visitor cannot sign up with invalid email address
  ##   Given I am not logged in
  ##   When I sign up with an invalid email address
  ##   Then I see an invalid email message
  scenario 'visitor cannot sign up with invalid email address' do
    sign_up_with('Test','User','bogus', 'pass1234', 'pass1234')
    expect(page).to have_content 'is invalid'
  end

  #
  ## Scenario: Visitor cannot sign up without password
  ##   Given I am not logged in
  ##   When I sign up without a password
  ##   Then I see a missing password message
  scenario 'visitor cannot sign up without password' do
    sign_up_with('Test','User','test@example.com', '', '')
    expect(page).to have_content "can't be blank"
  end
  #
  ## Scenario: Visitor cannot sign up with a short password
  ##   Given I am not logged in
  ##   When I sign up with a short password
  ##   Then I see a 'too short password' message
  scenario 'visitor cannot sign up with a short password' do
    sign_up_with('Test','User','test@example.com', 'pass', 'pass')
    expect(page).to have_content "is too short"
  end
  #
  ## Scenario: Visitor cannot sign up without password confirmation
  ##   Given I am not logged in
  ##   When I sign up without a password confirmation
  ##   Then I see a missing password confirmation message
  scenario 'visitor cannot sign up without password confirmation' do
    sign_up_with('Test','User','test@example.com', 'pass1234', '')
    expect(page).to have_content "doesn't match"
  end
  #
  ## Scenario: Visitor cannot sign up with mismatched password and confirmation
  ##   Given I am not logged in
  ##   When I sign up with a mismatched password confirmation
  ##   Then I should see a mismatched password message
  scenario 'visitor cannot sign up with mismatched password and confirmation' do
    sign_up_with('Test','User1','test@example.com', 'pass1234', 'mismatch')
    expect(page).to have_content "doesn't match"
  end

end