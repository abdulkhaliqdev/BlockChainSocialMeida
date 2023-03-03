class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :nfts, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.integer :price
      t.integer :royalty_percentage
      t.text :image_thumbnail_data
      t.string :description
      t.string :cloudinary_public_id

      t.timestamps
    end
  end
end
