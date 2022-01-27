require 'rails_helper'

RSpec.describe 'Login Features', type: :system do
  # before :each do
  #   User.make(email: 'user@example.com', password: 'password')
  # end

  it 'login page contains email, password and button elements' do
    visit new_user_session_path
    expect(page).to have_css '.test-email'
    expect(page).to have_css '.test-password'
    expect(page).to have_css '.test-button'
  end

  it 'return error if email and password fields are empty' do
    visit new_user_session_path
    within('.form-container') do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
    end
    click_button 'Log in'
    expect(page).to have_text 'Invalid Email or password.'
  end

  it 'return error if email and password fields are incorrect' do
    visit new_user_session_path
    within('.form-container') do
      fill_in 'Email', with: 'bob@test.com'
      fill_in 'Password', with: 'bob1234'
    end
    click_button 'Log in'
    expect(page).to have_text 'Invalid Email or password.'
  end

  it 'redirect to the homepage after login' do
    visit new_user_session_path
    within('.form-container') do
      fill_in 'Email', with: 'tom@test.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_current_path(root_path)
  end
end
