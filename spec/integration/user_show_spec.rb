require 'rails_helper'

RSpec.describe 'User Show Page Features', type: :system do
  before :each do
    User.create(id: 1, name: 'Al', email: 'al@example.com', password: 'password', confirmed_at: Time.now,
                bio: 'Test bio')

    visit new_user_session_path
    within('.form-container') do
      fill_in 'Email', with: 'al@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    Post.create(id: 4, title: 'post 1', text: 'text 1', likes_counters: 0, comments_counter: 0, user_id: 1)
    Post.create(id: 5, title: 'post 2', text: 'text 2', likes_counters: 0, comments_counter: 0, user_id: 1)
    Post.create(id: 6, title: 'post 3', text: 'text 3', likes_counters: 0, comments_counter: 0, user_id: 1)
  end

  it 'can see the username' do
    visit user_path(1)
    expect(page).to have_text('Al')
  end

  it 'can see the user profile pic' do
    visit user_path(1)
    expect(page).to have_css('.profile-pic')
  end

  it 'can see the number of posts the user has written' do
    visit user_path(1)
    expect(page).to have_all_of_selectors('.number-of-posts')
  end

  it 'can see the user\'s bio' do
    visit user_path(1)
    expect(page).to have_css('.user-bio')
  end

  it 'can see the user\'s first 3 posts' do
    visit user_path(1)
    res = page.all('.user-posts')
    expect(res.length).to eq 3
  end

  it 'can see a button that lets me view all of a user\'s posts' do
    visit user_path(1)
    expect(page).to have_button('See All Posts')
  end

  it 'redirect to the post\'s show page' do
    visit user_path(1)
    click_link(href: user_post_path(1, 4))
    expect(page).to have_current_path(user_post_path(1, 4))
  end

  it 'redirect to the user\'s all posts page' do
    visit user_path(1)
    click_link(href: user_posts_path(1))
    expect(page).to have_current_path(user_posts_path(1))
  end
end
