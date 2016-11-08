class ImageTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :image
  validates_uniqueness_of :tag_id, scope: :image_id, message: "#tag already exist"
end
