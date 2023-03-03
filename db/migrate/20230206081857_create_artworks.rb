class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :date_created
      t.string :list_price
      t.string :owner
      t.references :collection
      t.text :image_data
      t.text :img_url
      t.boolean :for_sale
      t.string :keywords
      t.text :img_thumb_data
      t.string :cloudinary_public_id

      t.timestamps
    end
  end
end
