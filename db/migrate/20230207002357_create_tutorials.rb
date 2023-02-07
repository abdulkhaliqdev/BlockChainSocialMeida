class CreateTutorials < ActiveRecord::Migration[6.1]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :topic
      t.string :video_url
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.string :cdy_public_id

      t.timestamps
    end
  end
end
