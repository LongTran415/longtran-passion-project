class Image < ActiveRecord::Base
  include Paperclip::Glue

  has_attached_file :data, styles: {
    large: "580x600#",
    medium: "300x300>",
    thumbnail: "150x150#"
   },
  path: "public/uploads/:attachment/:id/:style/:basename.:extension",
  url: "/uploads/:attachment/:id/:style/:basename.:extension"

  validates_attachment_content_type :data, content_type: /\Aimage\/.*\z/
  belongs_to :country
  belongs_to :portfolio
  has_many :comments
  has_many :image_tags
  has_many :tags, through: :image_tags

end
