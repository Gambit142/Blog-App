class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_likes_counters

  private

  def update_likes_counters
    post.increment!(:likes_counters)
  end
end
