class Tag < ActiveRecord::Base
  has_many :image_tags
  has_many :images, through: :image_tags
  validates_uniqueness_of :name, message: "#tag already exist"
end
