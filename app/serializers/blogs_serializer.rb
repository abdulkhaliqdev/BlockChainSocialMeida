class BlogsSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :coverPicture

  def description
    object.body.html_safe[0,160] if object.body.present?
  end

  def coverPicture
    object.image_url if object.image_data.present?
  end
end
