class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_recent_comments
    comments.order(created_at: :DESC).limit(5)
  end

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
