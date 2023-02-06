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

  has_many :invitations, dependent: :destroy
  has_many :pending_invitations,-> { where(confirmed: false)}, class_name: 'Invitation', foreign_key: 'friend_id'

  has_many :investments
  has_many :collections
  has_many :purchases
  has_many :nfts, through: :purchases
  has_many :cowries, through: :investments

  def follow(user)
    follower << user
  end

  def unfollow(following_user)
    follower.delete following_user
  end

  def friends
    send_friend_request = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    get_friend_request = Invitation.where(user_id: id, confirmed: true).pluck(:user_id)
    ids = send_friend_request + get_friend_request

    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.comfirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end
end
