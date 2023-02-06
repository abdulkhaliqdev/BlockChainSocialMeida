class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :date_created
      t.string :list_price
      t.string :owner
      t.references :collections, null: false, foreign_key: true
      t.text :img_data
      t.boolean :for_sale
      t.string :keywords
      t.text :img_thumb_data
      t.string :cloudinary_public_id

      t.timestamps
    end
  end
end
