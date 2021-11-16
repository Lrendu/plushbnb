# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

alex = User.create!(
  name: 'Alex',
  description: 'Les peluches, c\'est ma vie'
  email:    'alex@gmail.com',
  password: 'azertyu123'
)

joseph = User.create!(
  name: 'Joseph',
  description: 'La peluche, y a que ça de vrai!'
  email:    'jojo@gmail.com',
  password: 'ghcjgfh3569'
)

Plush.create!(
  name: 'Brie',
  description: 'La peluche Brie vous accompagne partout pour vous rappeler que le fromage c\'est la vie!',
  price: 15,25,
  user:
)

Restaurant.create!(
  name: 'Bomp',
  user: jojo
)

Restaurant.create!(
  name: 'Boston',
  user: alex
)

puts "#{User.count} users were created"
puts "#{Restaurant.count} restaurants were created"
