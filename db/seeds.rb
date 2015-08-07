# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


test_user = User.new(email: "standard@example.com", password: "helloworld")
test_user.skip_confirmation!
test_user.save

5.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

10.times do
  wiky = Wiky.new(
    title:  Faker::Company.bs,
    body:   Faker::Hacker.say_something_smart,
    created_at: rand(2.hours .. 1.year).ago
  )
  wiky.update_attributes(user: users.sample)
  wiky.save
  Collaboration.create(user: users.sample, wiky: wiky)
end

puts "DATABASE HAS BEEN SEEDED!!"
puts "#{users.count} Users were created"
puts "#{Wiky.all.count} Wikiess were created"
puts "#{Collaboration.all.count} Collaborations were created"