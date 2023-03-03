class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :body
      t.text :image_data
      t.references :user, null: false

      t.timestamps
    end
  end
end
