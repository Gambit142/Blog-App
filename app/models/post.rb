class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  after_save :update_post_counter

  def five_recent_comments
    comments.order(created_at: :DESC).limit(5)
  end

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
