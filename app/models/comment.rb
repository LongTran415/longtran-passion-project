class Comment < ActiveRecord::Base
  belongs_to :image
  belongs_to :user

  def author
    user ? user.username : "Anonymous"
  end
end
