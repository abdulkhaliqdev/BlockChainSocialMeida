class AddUserColumnToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :users, null: false, foreign_key: true
  end
end
