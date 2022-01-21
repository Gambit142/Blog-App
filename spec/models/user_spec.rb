require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Gambit', photo: 'string', bio: 'string', posts_counter: 0) }
  before { subject.save }

  describe 'validations of User model' do
    it 'should be a valid user' do
      expect(subject).to be_valid
    end

    it 'should be invalid if name column is blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid if posts_counter column is blank' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'test user methods' do
    it 'should test the functionality of three_recent_posts' do
      post1 = subject.posts.create!(title: 'Technology', text: 'This is a technology post', likes_counter: 0, comments_counter: 0)
      post2 = subject.posts.create!(title: 'Business', text: 'This is a business post', likes_counter: 0, comments_counter: 0)
      post3 = subject.posts.create!(title: 'Arts', text: 'This is a arts post', likes_counter: 0, comments_counter: 0)
      post4 = subject.posts.create!(title: 'Science', text: 'This is a science post', likes_counter: 0, comments_counter: 0)
      post5 = subject.posts.create!(title: 'Sports', text: 'This is a sports post', likes_counter: 0, comments_counter: 0)

      posts = subject.three_recent_posts
      expect(posts.length).to eql 3
      expect(posts).to match_array([post5, post4, post3])
    end
  end
end
