# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require "faker"
Message.destroy_all
Chatroom.destroy_all
Match.destroy_all
UserInterest.destroy_all
Interest.destroy_all
User.destroy_all


puts "create interests..."

Interest.create(name: "Swimming")
Interest.create(name: "Travel")
Interest.create(name: "Music")
Interest.create(name: "Dancing")
Interest.create(name: "Fitness")
Interest.create(name: "Nail polish party")
Interest.create(name: "Hiking")
Interest.create(name: "Cycling")
Interest.create(name: "Camping")
Interest.create(name: "Fishing")
Interest.create(name: "Photography")
Interest.create(name: "Climbing")
Interest.create(name: "Soccer")
Interest.create(name: "Basketball")
Interest.create(name: "Skating")
Interest.create(name: "Snowboarding")

puts "create users..."


10.times do
  new_user = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    user_name: Faker::Internet.username,
    address: Faker::Address.full_address,
    description: Faker::Quote.matz
  )

  2.times do
    UserInterest.create(user: new_user, interest: Interest.all.sample)
  end
end

Match.create(first_user: User.first, second_user: User.last, status: false)
Match.create(first_user: User.all[-2], second_user: User.all[2], status: false)
Match.create(first_user: User.all[15], second_user: User.all[17], status: true)

Chatroom.create(match: Match.last)

Message.create(content: "Hello!", chatroom: Chatroom.last, user: User.all[15])
Message.create(content: "Hi :)", chatroom: Chatroom.last, user: User.all[17])

puts "sucessfully created"
