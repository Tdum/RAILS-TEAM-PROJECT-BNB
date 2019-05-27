# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'unsplash'
require 'open-uri'
require 'nokogiri'

# puts "How many users would you like to create ?"
# user_number = gets.chomp
# puts "How many places would you like to create ?"
# place_number = gets.chomp.to_i
# puts "How many bookings would you like to create ?"
# booking_number = gets.chomp.to_i



puts "Destroying existing users, places & bookings..."

Booking.destroy_all
Place.destroy_all
User.destroy_all
puts "loading..."
puts
puts
#user input

puts "How many user do you want to create (max. 30) ?"
users = STDIN.gets.chomp.to_i
puts
puts "How many places do you want to create ?"
places = STDIN.gets.chomp.to_i
puts
puts "How many bookings do you want to instantiate ?"
bookings = STDIN.gets.chomp.to_i


puts "***********************************************************************"
puts "Let's create users"
puts "***********************************************************************"


# seed db with users


Unsplash::Photo.search('portrait', page = 1, per_page = users).each do |picture|
  User.create(
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    email: Faker::Internet.email,
    description: Faker::Hipster.paragraphs,
    password: 'password',
    # remote_....._url allow to upload on cloudinary
    remote_photo_url: picture[:urls][:small] # search in Unsplash object urls of small picture
    )
  sleep(0.5)
  puts "Create one user called #{User.last.first_name}"
  puts
end

User.create(
  first_name: 'To',
  last_name: 'To',
  email: 'toto@gmail.com',
  description: Faker::Hipster.paragraphs,
  password: 'password',
  # remote_....._url allow to upload on cloudinary
  remote_photo_url: Unsplash::Photo.search('portrait', page = 1, per_page = users).sample[:urls][:small] # search in Unsplash object urls of small picture
  )

puts "***********************************************************************"
puts "Users have been successfully created ! "
puts "***********************************************************************"
puts
puts


# seed db with Place Model

puts "Let's create places"
puts


party_types = ['Afterwork', 'Diner', 'Before Midnight', 'All Night Long']
# rooms_types = ['Kitchen', 'Sofa', 'Rooftop', 'home diner']


# addresses scrapping
puts
puts "***********************************************************************"
puts "SCRAPING ADDRESSES IN PARIS"
puts "***********************************************************************"
puts
puts

url = "https://www.bestrestaurantsparis.com/fr/restaurants.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
addresses = []
sleep(1)

# scrapping of 30 adresses

html_doc.search('.block-option-restaurant-address').first(places).each do |element|
  addresses << element.text.strip
  puts element.text.strip
end


# iteration on the 30 adresses

addresses.each do |address|

party_type = party_types.sample

place_created = Place.new(
  party_type: party_type,
  name: Faker::BossaNova.song,
  description: Faker::Restaurant.description,
  guest_capacity: (4..30).to_a.sample,
  # take an id among the users in db to reference the place
  user_id: User.all.sample.id,
  address: address,
  remote_photo_url: Unsplash::Photo.search('flat', page = 1, per_page = 30).sample[:urls][:small],
  price: (30..1000).to_a.sample
  )
sleep(0.5)

  place_created.save!

  puts "A place called '#{place_created.name}' has been created by #{place_created.user.first_name}, with a guest capacity of #{place_created.guest_capacity} and is located in #{place_created.address}"
  puts
end

puts
puts "***********************************************************************"
puts "Places have been successfully created ! "
puts "***********************************************************************"


# Seed DB with bookings

bookings.times do

booking_new = Booking.new(
  booking_type: party_types.sample,
  guests: (4..30).to_a.sample,
  date: Faker::Date.forward(23),
  user_id: User.all.sample.id,
  place_id: Place.all.sample.id
  )

p booking_new

booking_new.save!

end

puts "***********************************************************************"
puts "Bookings have been successfully created ! "
puts "***********************************************************************"



puts "  /$$$$$$  /$$$$$$$  /$$$$$$$        /$$   /$$ /$$$$$$$$ /$$$$$$$   /$$$$$$  /$$$$$$$$  /$$$$$$
 /$$__  $$| $$__  $$| $$__  $$      | $$  | $$| $$_____/| $$__  $$ /$$__  $$| $$_____/ /$$__  $$
| $$  \ $$| $$  \ $$| $$  \ $$      | $$  | $$| $$      | $$  \ $$| $$  \ $$| $$      | $$  \__/
| $$$$$$$$| $$$$$$$/| $$$$$$$/      | $$$$$$$$| $$$$$   | $$$$$$$/| $$  | $$| $$$$$   |  $$$$$$
| $$__  $$| $$____/ | $$____/       | $$__  $$| $$__/   | $$__  $$| $$  | $$| $$__/    \____  $$
| $$  | $$| $$      | $$            | $$  | $$| $$      | $$  \ $$| $$  | $$| $$       /$$  \ $$
| $$  | $$| $$      | $$            | $$  | $$| $$$$$$$$| $$  | $$|  $$$$$$/| $$$$$$$$|  $$$$$$/
|__/  |__/|__/      |__/            |__/  |__/|________/|__/  |__/ \______/ |________/ \______/"
