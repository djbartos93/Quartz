# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
    email: "admin@example.com",
    password: "admin1234",
    password_confirmation: "admin1234",
    admin: "1"
)
user.skip_confirmation! #only if using confirmable in devise settings in user model.
user.save!
