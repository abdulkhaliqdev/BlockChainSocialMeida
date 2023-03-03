class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :profilePicture, :city, :from, :relationship

  attribute :description, key: :desc

  def profilePicture
    object.profile_data ? object.profile_url : object.profile_image_url 
  end
end
