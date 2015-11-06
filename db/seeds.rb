# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
User.create!(username: "Example User",
             email:    "example@testing.org",
	     password: "examplepin")

99.times do |n|
  username = Faker::Name.name
  email    = "example-#{n+1}@testing.org"
  password = "examplepin"
  User.create!(username: username,
  	       email:    email,
	       password: password)
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }