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



puts "Destroying existing users..."

User.destroy_all



Unsplash::Photo.search('portrait', page = 1, per_page = 30).each do |picture|
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
end

