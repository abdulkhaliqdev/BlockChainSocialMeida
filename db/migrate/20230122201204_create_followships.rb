class CreateFollowships < ActiveRecord::Migration[6.1]
  def change
    create_table :followships do |t|
      t.integer :follower_id, foreign_key: { to_table: :users }
      t.integer :following_id, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :followships, :follower_id
    add_index :followships, :following_id
    add_index :followships, [:follower_id, :following_id], unique: true
  end
end
