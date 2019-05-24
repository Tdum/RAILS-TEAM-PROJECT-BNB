# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


puts "Destroying existing users..."

User.destroy_all

100.times do

User.new(
  first_name: Faker::Name.name.first_name,
  last_name: Faker::Name.name.last_name,
  email: Faker::Internet.email,
  encrypted_password:


  )

end

