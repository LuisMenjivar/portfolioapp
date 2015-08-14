# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.delete_all
Wiky.delete_all
Topic.delete_all
Bookmark.delete_all
Product.delete_all

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

3.times do 
  topic = test_user.topics.new(title: Faker::Company.name)
  topic.save
end

10.times do 
  bookmark = Bookmark.new(url: Faker::Company.logo, topic_id: rand(1..3))
  bookmark.save
end

3.times do 
  Product.create!(title: Faker::Company.bs,
    description: Faker::Hacker.say_something_smart,
    image_url: Faker::Company.logo,
    price: 19.99)
end



puts "DATABASE HAS BEEN SEEDED!!"
puts "#{users.count} Users were created"
puts "#{Wiky.all.count} Wikiess were created"
puts "#{Collaboration.all.count} Collaborations were created"
puts "#{Bookmark.all.count} Bookmarks were created" 
puts "#{Product.all.count} products were created"
