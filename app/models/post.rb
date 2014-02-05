class Post < ActiveRecord::Base

  validates_inclusion_of :category, :in => [ "general", "nightclub", "workplace", "school", "relationships", "hookups" ]
  self.per_page = 20
end
