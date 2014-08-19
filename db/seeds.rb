# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create Posts
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

50.times do
  Post.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    # user: users.sample, # We're going to do this, but we haven't created a Users comment association yet
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

me = User.first
me.email = "stephen.m.cabrera@gmail.com"
me.password = "password"
me.skip_reconfirmation!
me.save!
 

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

