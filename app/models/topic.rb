class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :articles

  validates_presence_of :name
end
