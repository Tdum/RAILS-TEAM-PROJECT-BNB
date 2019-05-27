# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'unsplash'

# puts "How many users would you like to create ?"
# user_number = gets.chomp
# puts "How many places would you like to create ?"
# place_number = gets.chomp.to_i
# puts "How many bookings would you like to create ?"
# booking_number = gets.chomp.to_i



puts "Destroying existing users, places & bookings..."

User.destroy_all
Place.destroy_all
Booking.destroy_all
puts "***********************************************************************"
puts "Let's create users"
puts "***********************************************************************"


Unsplash::Photo.search('portrait', page = 1, per_page = 2).each do |picture|
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
  puts "***********************************************************************"

end


# seed db with Place Model

puts "Let's create places"


party_types = ['Afterwork', 'Diner', 'Before Midnight', 'All Night Long']
rooms_types = ['Kitchen', 'Sofa', 'Rooftop', 'home diner']



5.times do

photos = rooms_types.map do |room|
     {
      "title": room,
      "description": Faker::Restaurant.description,
      "url": Unsplash::Photo.search(room, page = (1..3).to_a.sample, per_page = 30).sample[:urls][:small],
    }
end



place_created = Place.create(
  party_type: party_types.sample,
  name: Faker::BossaNova.song,
  description: Faker::Restaurant.description,
  guest_capacity: (4..30).to_a.sample,
  # take an id among the users in db to reference the place
  user_id: User.all.sample.id,
  address: Faker::Address.full_address,
  photos: photos,
  price: (30..1000).to_a.sample
  )

  puts place_created.valid?

  puts "A place called '#{place_created.name}' has been created by #{place_created.user.first_name}, with a guest capacity of #{place_created.guest_capacity} and is located in #{place_created.address}"
  puts "***********************************************************************"

end

puts "30 places have been successfully created ! "
puts "***********************************************************************"
puts "\\\\\\"

puts "  /$$$$$$  /$$$$$$$  /$$$$$$$        /$$   /$$ /$$$$$$$$ /$$$$$$$   /$$$$$$  /$$$$$$$$  /$$$$$$
 /$$__  $$| $$__  $$| $$__  $$      | $$  | $$| $$_____/| $$__  $$ /$$__  $$| $$_____/ /$$__  $$
| $$  \ $$| $$  \ $$| $$  \ $$      | $$  | $$| $$      | $$  \ $$| $$  \ $$| $$      | $$  \__/
| $$$$$$$$| $$$$$$$/| $$$$$$$/      | $$$$$$$$| $$$$$   | $$$$$$$/| $$  | $$| $$$$$   |  $$$$$$
| $$__  $$| $$____/ | $$____/       | $$__  $$| $$__/   | $$__  $$| $$  | $$| $$__/    \____  $$
| $$  | $$| $$      | $$            | $$  | $$| $$      | $$  \ $$| $$  | $$| $$       /$$  \ $$
| $$  | $$| $$      | $$            | $$  | $$| $$$$$$$$| $$  | $$|  $$$$$$/| $$$$$$$$|  $$$$$$/
|__/  |__/|__/      |__/            |__/  |__/|________/|__/  |__/ \______/ |________/ \______/"
