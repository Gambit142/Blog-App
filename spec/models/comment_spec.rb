require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user1 = User.new(name: 'Gambit', photo: 'string', bio: 'string', posts_counter: 0)
    Post.create!(title: 'Business', text: 'This is a business post', likes_counters: 0, comments_counter: 0,
                 user: user1)
  end

  describe 'test comments methods' do
    it 'should test the functionality of the update_comments_counter' do
      user2 = User.create!(name: 'Thunder Cat', photo: 'photo4', bio: 'Lorem ipsum dolor', posts_counter: 0)
      user2.comments.create!(text: 'first_comment', post: subject)
      user2.comments.create!(text: 'second_comment', post: subject)
      user2.comments.create!(text: 'third_comment', post: subject)

      expect(subject.comments_counter).to eql 3
    end
  end
end
