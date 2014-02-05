class Post < ActiveRecord::Base

  validates_inclusion_of :category, :in => [ "general", "nightclub", "workplace", "school", "relationships", "hookups" ]
  self.per_page = 20
  validates :title, :presence => {:message => 'Title cannot be blank'}
  validates :body, :presence => {:message => 'Body cannot be blank'}
end
