class Nft < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases
end
