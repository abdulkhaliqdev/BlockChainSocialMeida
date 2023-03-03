class CreateNfts < ActiveRecord::Migration[6.1]
  def change
    create_table :nfts do |t|
      t.integer :token_id
      t.text :image_data
      t.integer :cloudary_public_id

      t.timestamps
    end
  end
end
