# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

#Create Users
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

# Create Topics
5.times do
  Topic.create!(
    name:        Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
  )
end
topics = Topic.all

# Create Posts
30.times do
  post = Post.create!(
    user:  users.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph,
    topic: topics.sample
  )
  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.update_rank
  post.create_vote
end

# set the created_at to a time within the past year
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

me = User.first
me.name = "Stephen Mariano Cabrera"
me.email = "stephen.m.cabrera@gmail.com"
me.password = "password"
me.skip_reconfirmation!
me.save

# Create different types of test users
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

admin.skip_confirmation!
admin.save

moderator = User.new(
  name:     'Moderator User',
  email:    'moderator@example.com',
  password: 'helloworld',
  role:     'moderator'
)

moderator.skip_confirmation!
moderator.save

member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)
member.skip_reconfirmation!
member.save

#[admin, moderator, member].each do |user|
#  user.password = 'helloworld'
#  user.save!
#end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"





