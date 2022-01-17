class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :likes_counters
      t.integer :comments_counter

      t.timestamps
    end
  end
end
