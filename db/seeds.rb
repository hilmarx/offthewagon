# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.create(email: "012@yahoo.com")
# User.create(email: "345@yahoo.com")
# User.create(email: "678@yahoo.com")



Teacher.create(user_id: 1, hourly_price: 60)

Booking.create(teacher_id: 1, user_id: 1, start_time: "10", end_time: "11", total_price: "60", status: "pending")
Booking.create(teacher_id: 2, user_id: 2, start_time: "3", end_time: "6", total_price: "120", status: "complete")
