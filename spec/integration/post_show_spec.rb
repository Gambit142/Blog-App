require 'rails_helper'

RSpec.describe 'Post Show Page Features', type: :feature, js: true do
  before(:all) do
    # Selenium::WebDriver.logger.level = :debug
    Capybara.current_driver = :headless_chrome
    Capybara.javascript_driver = :headless_chrome
  end

  after(:all) do
    Capybara.use_default_driver
  end

  before :each do
    @user1 = User.create(name: 'Al', email: 'al@example.com', password: 'password', confirmed_at: Time.now,
                bio: 'Test bio')

    visit new_user_session_path
    within('.form-container') do
      fill_in 'Email', with: 'al@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    @post1 = Post.create(title: 'post 1', text: 'text 1', likes_counters: 0, comments_counter: 0, user_id: @user1.id)
    @post2 = Post.create(title: 'post 2', text: 'text 2', likes_counters: 0, comments_counter: 0, user_id: @user1.id)
    Post.create(title: 'post 3', text: 'text 3', likes_counters: 0, comments_counter: 0, user_id: @user1.id)
    Post.create(title: 'post 4', text: 'text 4', likes_counters: 0, comments_counter: 0, user_id: @user1.id)

    @user1.comments.create(text: 'This is comment 1', post: @post1)
    @user1.comments.create(text: 'This is comment 2', post: @post1)
    @user1.comments.create(text: 'This is comment 3', post: @post2)

    @user1.likes.create(post: @post1)
  end

  it 'can see the post\'s title' do
    visit  user_post_path(@user1.id, @post1.id)
    expect(page).to have_content('post 1')
  end

  it 'can see the who wrote the post' do
    visit  user_post_path(@user1.id, @post1.id)
    expect(page).to have_content('Al')
  end

  it 'can see how many comments a post has' do
    visit  user_post_path(@user1.id, @post1.id)
    expect(page).to have_content('Comments: 2')
    visit  user_post_path(@user1.id, @post2.id)
    expect(page).to have_content('Comments: 1')
  end

  it 'can see how many likes a post has' do
    visit  user_post_path(@user1.id, @post1.id)
    expect(page).to have_content('Likes: 1')
  end

  it 'can see the post\'s body' do
    visit  user_post_path(@user1.id, @post1.id)
    expect(page).to have_content('text 1')
  end

  it 'can see the user name of the commentor' do
    visit  user_post_path(@user1.id, @post1.id)
    expect(page).to have_content('Al')
  end

  it 'can see comment made by the commmentor' do
    visit  user_post_path(@user1.id, @post1.id)
    expect(page).to have_content('This is comment 1')
    expect(page).to have_content('This is comment 2')
    visit  user_post_path(@user1.id, @post2.id)
    expect(page).to have_content('This is comment 3')
  end
end
