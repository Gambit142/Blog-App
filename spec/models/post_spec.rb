require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { 
    user1 = User.new(name: 'Gambit', photo: 'string', bio: 'string', posts_counter: 0)
    Post.create!(title: 'Business', text: 'This is a business post', likes_counter: 0, comments_counter: 0, user: user1)
  }

  describe 'validations of Post model' do
    it 'should be a valid post' do
      expect(subject).to be_valid
    end

    it 'should be invalid if title column is blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid if text is more than 250 characters' do
      subject.title = 'r' * 260
      expect(subject).to_not be_valid
    end

    it 'should be invalid if text is blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid if likes_counter is blank' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'should be invalid if comments_counter is blank' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'test post methods' do
    it 'should test the functionality of five_recent_posts' do
      user2 = User.create!(name: 'Thunder Cat', photo: 'photo4', bio: 'Lorem ipsum dolor', posts_counter: 0)
      comment1 = user2.comments.create!(text: 'first_comment', post: subject)
      comment2 = user2.comments.create!(text: 'second_comment', post: subject)
      comment3 = user2.comments.create!(text: 'third_comment', post: subject)
      comment4 = user2.comments.create!(text: 'fourth_comment', post: subject)
      comment5 = user2.comments.create!(text: 'fifth_comment', post: subject)
      comment6 = user2.comments.create!(text: 'sixth_comment', post: subject)
      comment7 = user2.comments.create!(text: 'seventh_comment', post: subject)

      total_comments = subject.five_recent_comments
      expect(total_comments.length).to eql 5
      expect(total_comments).to match_array([comment7, comment6, comment5, comment4, comment3])
    end

    it 'should test the functionality of the update_posts_counter' do
      expect(subject.user.posts_counter).to eql 1
    end
  end
end
