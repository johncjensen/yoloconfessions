# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.create(email: "admin@admin.com", password: "password1!", password_confirmation: "password1!")


require 'ffaker'

100.times do
  Post.new.tap do |p|
    p.title = Faker::HipsterIpsum.sentence(1)
    p.body = Faker::HipsterIpsum.paragraph
    p.category = "school"
    p.visible = true
    p.save!
  end
end

100.times do
  Post.new.tap do |p|
    p.title = Faker::HipsterIpsum.sentence(1)
    p.body = Faker::HipsterIpsum.paragraph
    p.category = "general"
    p.visible = true
    p.save!
  end
end

100.times do
  Post.new.tap do |p|
    p.title = Faker::HipsterIpsum.sentence(1)
    p.body = Faker::HipsterIpsum.paragraph
    p.category = "nightclub"
    p.visible = true
    p.save!
  end
end

100.times do
  Post.new.tap do |p|
    p.title = Faker::HipsterIpsum.sentence(1)
    p.body = Faker::HipsterIpsum.paragraph
    p.category = "relationships"
    p.visible = true
    p.save!
  end
end

100.times do
  Post.new.tap do |p|
    p.title = Faker::HipsterIpsum.sentence(1)
    p.body = Faker::HipsterIpsum.paragraph
    p.category = "hookups"
    p.visible = true
    p.save!
  end
end

100.times do
  Post.new.tap do |p|
    p.title = Faker::HipsterIpsum.sentence(1)
    p.body = Faker::HipsterIpsum.paragraph
    p.category = "workplace"
    p.visible = true
    p.save!
  end
end
