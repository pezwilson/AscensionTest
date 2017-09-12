# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'admin@jackson.com', password: 'pass1111', password_confirmation: 'pass1111', first_name: 'Frank', last_name: 'Jackson', role: 'admin' )
User.create(email: 'billy@jackson.com', password: 'pass1111', password_confirmation: 'pass1111', first_name: 'Billy', last_name: 'Jackson', role: 'support' )
User.create(email: 'sally@jackson.com', password: 'pass1111', password_confirmation: 'pass1111', first_name: 'Sally', last_name: 'Jackson', role: 'community' )