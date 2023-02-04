# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create([{name: "first", time_zone: "Taipei"}, {name: "second", time_zone: "Tokyo"}, {name: "third", time_zone: "Tokyo"}])
UserFollow.create(user: user[0], follow: user[1])
UserFollow.create(user: user[0], follow: user[2])
