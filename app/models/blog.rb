class Blog < ApplicationRecord
  include ImageUploader::Attachment(:image)

  has_many :comments, counter_cache: true
  has_many :like, counter_cache: true

  belongs_to :user
  has_many :likes, dependent: :destroy, counter_cache: true

  validates :title, :body, presence: true 

  def liked?(user)
    !!self.likes.find{ |like| like.user_id == user.id }
  end
end
