class Post < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged
  self.per_page = 25


  validates_inclusion_of :category, :in => [ "general", "nightclub", "workplace", "school", "relationships", "hookups" ]
  validates :title, :presence => {:message => 'Title cannot be blank'}, :length => {:maximum => 100}
  validates :body, :presence => {:message => 'Body cannot be blank'}
end
