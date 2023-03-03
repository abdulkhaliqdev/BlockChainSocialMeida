class Invitation < ApplicationRecord
  belongs_to :user

  def self.reacted? (id1, id2)
    !Invitation.where(user_id: id1, friend_id: id2).empty? || !Invitation.where(user_id: id2, friend_id: id1).empty? 
  end

  def self.confirmed_record? (id1, id2)
    !Invitation.where(user_id: id1, friend_id: id2, confirmed: true).empty? || !Invitation.where(user_id: id2, friend_id: id1, confirmed: true).empty? 
  end

  def self.find_invitation(id1, id2)
    Invitation.where(user_id: id2, friend_id: id1, confirmed: true)[0].id || Invitation.where(user_id: id1, friend_id: id2, confirmed: true)[0].id
  end
end
