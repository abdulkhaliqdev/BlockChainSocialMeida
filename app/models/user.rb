class User < ApplicationRecord
  include ImageUploader::Attachment(:profile)

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :email, format: URI::MailTo::EMAIL_REGEXP

  has_many :blogs, counter_cache: true
  has_many :followships, class_name: "Followship", foreign_key: "follower_id", dependent: :destroy
  has_many :follower, through: :followships
  has_many :followships, class_name: "Followship", foreign_key: "following_id", dependent: :destroy
  has_many :following, through: :followships
  has_many :likes, dependent: :destroy, counter_cache: true

  def follow(user)
    follower << user
  end

  def unfollow(following_user)
    follower.delete following_user
  end

  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end
end
