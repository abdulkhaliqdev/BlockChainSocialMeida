class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :users
      t.references :blogs

      t.timestamps
    end
  end
end
