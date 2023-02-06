class CreateEthAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :eth_accounts do |t|
      t.string :eth_address
      t.string :eth_nonce
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
