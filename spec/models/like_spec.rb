require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user1 = User.new(name: 'Gambit', photo: 'string', bio: 'string', posts_counter: 0)
    Post.create!(title: 'Business', text: 'This is a business post', likes_counters: 0, comments_counter: 0,
                 user: user1)
  end

  describe 'test likes methods' do
    it 'should test the functionality of the update_likes_counters' do
      user2 = User.create!(name: 'Thunder Cat', photo: 'photo4', bio: 'Lorem ipsum dolor', posts_counter: 0)
      user2.likes.create!(post: subject)
      user2.likes.create!(post: subject)
      user2.likes.create!(post: subject)
      user2.likes.create!(post: subject)
      user2.likes.create!(post: subject)

      expect(subject.likes_counters).to eql 5
    end
  end
end
