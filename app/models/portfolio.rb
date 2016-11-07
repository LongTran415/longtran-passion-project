class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :images
  delegate :username, to: :user
end
