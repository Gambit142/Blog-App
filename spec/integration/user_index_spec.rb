require 'rails_helper'

RSpec.describe 'User Index Page Features', type: :feature, js: true do
  before(:all) do
    # Selenium::WebDriver.logger.level = :debug
    Capybara.current_driver = :headless_chrome
    Capybara.javascript_driver = :headless_chrome
  end

  after(:all) do
    Capybara.use_default_driver
  end

  before :each do
    @user1 = User.create(name: 'Al', email: 'al@example.com', password: 'password', confirmed_at: Time.now)
  end

  it 'can see the username of all other users' do
    visit users_path
    expect(page).to have_all_of_selectors('.username')
  end

  it 'can see the profile pic of each users' do
    visit users_path
    expect(page).to have_all_of_selectors('.profile-pic')
  end

  it 'can see the number of posts each user has written' do
    visit users_path
    expect(page).to have_all_of_selectors('.number-of-posts')
  end

  it 'redirect to the user\'s show page' do
    visit users_path
    click_link(href: user_path(@user1.id))
    expect(page).to have_current_path(user_path(@user1.id))
  end
end
