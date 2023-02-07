class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.string :title
      t.string :description
      t.references :user
      t.text :collection_image_data
      t.string :collection_img
      t.string :cdy_public_id

      t.timestamps
    end
  end
end
