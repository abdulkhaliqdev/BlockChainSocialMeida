class Comment < ApplicationRecord
  belongs_to :blog

  validates :message, presence: true
end
