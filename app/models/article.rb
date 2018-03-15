class Article < ActiveRecord::Base
  belongs_to :topic

  validates_presence_of :title, :url

  # def slug
  #   title.downcase.gsub(/\W/, "-")
  # end
  #
  # def self.find_by_slug(slug)
  #   Article.all.find {|article| article.slug == slug}
  # end

end
