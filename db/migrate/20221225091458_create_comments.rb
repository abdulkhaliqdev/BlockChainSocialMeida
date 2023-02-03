class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :blogs
      t.string :message

      t.timestamps
    end
  end
end
