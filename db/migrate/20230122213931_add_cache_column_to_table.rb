class AddCacheColumnToTable < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :blog_count, :integer, default: 0, null: false
    add_column :users, :followships_count, :integer, default: 0, null: false
    add_column :users, :likes_count, :integer, default: 0, null: false

    add_column :blogs, :likes_count, :integer, default: 0, null: false
    add_column :blogs, :comments_count, :integer, default: 0, null: false

    add_column :blogs, :user_id, :integer
    add_foreign_key :blogs, :users

    add_column :blogs, :image_data, :text 
    add_column :users, :profile_data, :text 
  end
end
