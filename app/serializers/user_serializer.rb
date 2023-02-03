class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :profilePicture, :city, :from, :relationship

  attribute :description, key: :desc

  def profilePicture
    object.profile_url if object.profile_data.present?
  end
end
