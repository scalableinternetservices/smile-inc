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
  user = User.create(username: username,
                     email:    email,
                     password: password )
  aboutme = Faker::Company.catch_phrase
  fname = Faker::Name.first_name
  lname = Faker::Name.last_name
  user.profile.update(first_name: fname,
                      last_name:  lname,
                      about_me:   aboutme )
  image = rand(1..5)
  path = "#{Rails.root}/public/images/#{image}.jpeg"
  user.profile.avatar = File.open(path)
  user.save!
  #Note when seeding on AWS might not work
  #Path issues
  
end

# Following relationships
users = User.all
user  = users.first
following = users[20..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
