class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.string :title
      t.string :description
      t.references :users, null: false, foreign_key: true
      t.text :collection_img_data
      t.string :cloudinary_public_id

      t.timestamps
    end
  end
end
