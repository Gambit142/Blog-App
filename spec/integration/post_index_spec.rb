require 'rails_helper'

RSpec.describe 'Post Index Page Features', type: :feature, js: true do
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
    post1 = Post.create(id: 4, title: 'post 1', text: 'text 1', likes_counters: 0, comments_counter: 0, user_id: @user1.id)
    post2 = Post.create(id: 5, title: 'post 2', text: 'text 2', likes_counters: 0, comments_counter: 0, user_id: @user1.id)
    Post.create(id: 6, title: 'post 3', text: 'text 3', likes_counters: 0, comments_counter: 0, user_id: @user1.id)
    Post.create(id: 7, title: 'post 4', text: 'text 4', likes_counters: 0, comments_counter: 0, user_id: @user1.id)

    @user1.comments.create(text: 'This is comment 1', post: post1)
    @user1.comments.create(text: 'This is comment 2', post: post1)
    @user1.comments.create(text: 'This is comment 3', post: post2)

    @user1.likes.create(post: post1)
  end

  it 'can see the user\'s profile picture' do
    visit  user_posts_path(@user1.id)
    expect(page).to have_css('.profile-pic')
  end

  it 'can see the user\'s username' do
    visit  user_posts_path(@user1.id)
    expect(page).to have_content('Al')
  end

  it 'can see the number of posts the user has written' do
    visit  user_posts_path(@user1.id)
    expect(page).to have_content('Number of Posts: 4')
  end

  it 'can see the post\'s title' do
    visit  user_posts_path(@user1.id)
    expect(page).to have_content('post 1')
  end

  it 'can see the post\'s body' do
    visit  user_posts_path(@user1.id)
    expect(page).to have_content('text 4')
  end

  it 'can see the first comments of a post' do
    visit  user_posts_path(@user1.id)
    expect(page).to have_content('This is comment 1')
  end

  it 'can see how many comments a post has' do
    visit  user_posts_path(@user1.id)
    expect(page).to have_content('Comments: 2')
  end

  it 'can see how many likes a post has' do
    visit  user_posts_path(@user1.id)
    expect(page).to have_content('Likes: 1')
    expect(page).to have_content('Likes: 0')
  end

  it 'can see a section for pagination if there are more posts than fit on the view' do
    visit  user_posts_path(@user1.id)
    expect(page).to have_button('Pagination')
  end

  it 'When I click on a post, it redirects me to that post\'s show page' do
    visit  user_posts_path(@user1.id)
    click_link(href: user_post_path(@user1.id, 6))
    expect(page).to have_current_path(user_post_path(@user1.id, 6))
  end
end
