# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Plush.destroy_all
Rental.destroy_all

alex = User.create!(
  name: 'Alex',
  description: 'Les peluches, c\'est ma vie',
  email: 'alex@gmail.com',
  password: 'azertyu123'
)

joseph = User.create!(
  name: 'Joseph',
  description: 'La peluche, y a que ça de vrai!',
  email: 'jojo@gmail.com',
  password: 'ghcjgfh3569'
)

eleonore = User.create!(
  name: 'Eleonore',
  description: 'Les bisounours me font rêver!',
  email: 'leo@gmail.com',
  password: 'lugjhg87654'
)

betty = User.create!(
  name: 'Betty',
  description: 'Mieux qu\'une peluche : deux peluches!',
  email: 'bet@gmail.com',
  password: 'gjhhg3567'
)
puts "#{User.count} users were created"

brie = Plush.create!(
  name: 'Brie',
  description: 'La peluche Brie vous accompagne partout pour vous rappeler que le fromage c\'est la vie!',
  price: 15.25,
  owner: alex
)

ketchup = Plush.create!(
  name: 'Ketchup',
  description: 'La peluche Ketchup vous permet d\'assaisonner vos moments moins up',
  price: 12.32,
  owner: joseph
)
puts "#{Plush.count} plushes were created"

Rental.create!(
  date: DateTime.strptime("15/12/2021"),
  tenant: eleonore,
  plush: brie
)

Rental.create!(
  date: DateTime.strptime("05/01/2022"),
  tenant: betty,
  plush: ketchup
)

puts "#{Rental.count} rentals were created"
