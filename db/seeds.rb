# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create users & objectives

5.times do
  password = Faker::Lorem.characters(8)
  user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password)
  
  user.skip_confirmation! # sets confirmation date to avoid sending an email
  user.save # updates database

  5.times do
    item = Item.create!(
      user: user,
      name: Faker::Lorem.sentence)
    item.update_attribute(:created_at, Time.now - rand(600..606461))
  end
end

user = User.first
user.skip_confirmation!
user.update_attributes(username: "Me", email: "jmci10@hotmail.com", password: "helloworld", password_confirmation: "helloworld")

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Item.count} objectives created"