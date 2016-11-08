class User < ActiveRecord::Base

  validates_presence_of :username, message: "can't be blank"
  validates_uniqueness_of :username, message: "already exist"
  validates_presence_of :password, message: "can't be blank"
  validates_presence_of :email, message: "can't be blank"
  validates_uniqueness_of :email, message: "already exist"

  has_many :portfolios
  has_many :comments

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(email, txt_password)
    self.email == email && self.password == txt_password
  end

end
