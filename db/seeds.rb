# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(pseudo: 'participant', email: 'participant@example.com', password: 'password')

Post.create(title: '1st post', body: 'this is the body `this is the snippet`', user_id: user.id)
