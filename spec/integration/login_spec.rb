require 'rails_helper'

RSpec.describe 'Login Features', type: :system do
  # before :each do
  #   User.make(email: 'user@example.com', password: 'password')
  # end
  it "signs me in" do
    visit new_user_session_path
    # within("#session") do
    #   fill_in 'Email', with: 'user@example.com'
    #   fill_in 'Password', with: 'password'
    # end
    # click_button 'Sign in'
    expect(page).to have_selector 'test-email'
    expect(page).to have_selector 'test-password'
    expect(page).to have_selector 'test- button'
  end
end