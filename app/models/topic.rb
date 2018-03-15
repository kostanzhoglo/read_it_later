class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :articles

  validates_presence_of :name

  def slug
    name.downcase.gsub(/\W/, "-")
  end

  def self.find_by_slug(slug)
    Topic.all.find {|topic| topic.slug == slug}
  end

end
