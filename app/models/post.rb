class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :users
end