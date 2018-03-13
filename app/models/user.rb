class User < ActiveRecord::Base
  has_many :topics

  has_secure_password
  validates_presence_of :username, :email, :password
  validates :username, uniqueness: true
end
