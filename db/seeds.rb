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

bed_time_second = [
  {user_id: 2, is_bedtime: true, created_at: '2023-02-01 20:00:00'},
  {user_id: 2, is_bedtime: false, created_at: '2023-02-02 08:00:00'},
  {user_id: 2, is_bedtime: true, created_at: '2023-02-02 21:00:00'},
  {user_id: 2, is_bedtime: false, created_at: '2023-02-03 07:00:00'},
  {user_id: 2, is_bedtime: false, created_at: '2023-02-03 08:00:00'},
  {user_id: 2, is_bedtime: true, created_at: '2023-02-03 20:00:00'},
  {user_id: 2, is_bedtime: true, created_at: '2023-02-03 23:00:00'},
  {user_id: 2, is_bedtime: false, created_at: '2023-02-04 10:00:00'},
  {user_id: 2, is_bedtime: true, created_at: '2023-02-04 23:00:00'},
  {user_id: 2, is_bedtime: false, created_at: '2023-02-05 06:00:00'},
  {user_id: 2, is_bedtime: true, created_at: '2023-02-05 20:00:00'},
]

bed_time_third = [
  {user_id: 3, is_bedtime: true, created_at: '2023-02-01 20:00:00'},
  {user_id: 3, is_bedtime: false, created_at: '2023-02-02 08:00:00'},
  {user_id: 3, is_bedtime: true, created_at: '2023-02-02 21:00:00'},
  {user_id: 3, is_bedtime: false, created_at: '2023-02-03 07:00:00'},
  {user_id: 3, is_bedtime: false, created_at: '2023-02-03 08:00:00'},
  {user_id: 3, is_bedtime: true, created_at: '2023-02-03 20:00:00'},
  {user_id: 3, is_bedtime: true, created_at: '2023-02-03 23:00:00'},
  {user_id: 3, is_bedtime: false, created_at: '2023-02-04 10:00:00'},
  {user_id: 3, is_bedtime: true, created_at: '2023-02-04 23:00:00'},
  {user_id: 3, is_bedtime: false, created_at: '2023-02-05 06:00:00'},
  {user_id: 3, is_bedtime: true, created_at: '2023-02-05 20:00:00'},
]
bed_time_second.each { Clock.create(_1) }
bed_time_third.each { Clock.create(_1) }
