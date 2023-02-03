class AddUsernameColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :followers, :string
    add_column :users, :followings, :string
    add_column :users, :description, :text
    add_column :users, :city, :string
    add_column :users, :from, :text
    add_column :users, :relationship, :text
  end
end
