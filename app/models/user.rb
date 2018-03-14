class User < ActiveRecord::Base
  has_many :topics

  has_secure_password
  validates_presence_of :username, :email, :password
  validates :username, uniqueness: true

  def slug
    username.downcase.gsub(/\W/, "-")
  end

  def self.find_by_slug(slug)
    User.all.find {|user| user.slug == slug}
  end

end
