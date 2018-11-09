puts "Deleting all bookings..."
Booking.destroy_all

puts "Deleting teacher skills..."
TeacherSkill.destroy_all

puts "Deleting all teachers..."
Teacher.destroy_all

puts "Deleting all users..."
User.destroy_all


puts "Deleting skills..."
Skill.destroy_all

puts "Generating users..."

#user_array = []
20.times do
  
  user = User.new(email: Faker::Internet.email, password: Faker::Internet.password(6))
  user.save!
 #Jethro Code
 #user_array << User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
end
#p user_array

puts "Users generated"
puts "Generating skills..."

Skill.create(name: 'ruby')
Skill.create(name: 'javascript')
Skill.create(name: 'swift')
Skill.create(name: 'c')
Skill.create(name: 'python')

puts "Skills generated"
puts "Generating teachers..."

counter = User.first.id

20.times do
  teach = Teacher.new(user_id: counter, hourly_price: Faker::Number.number(3), available_from: Date.today, available_to: (Date.today + rand(100)))
  teach.save!
  counter += 1
  
#Jethro Code
#20.times do |n|
  #user = User.find(n + 1)
  #Teacher.create!(hourly_price: Faker::Number.number(3), available_from: Date.today, available_to: (Date.today + rand(100)), user: user)
end

puts "Teachers generated"
puts "Generating teacher skills..."

level_array = [1, 2, 3, 4, 5]
20.times do
  TeacherSkill.create(name: Skill.all.sample.name, level: level_array.sample, teacher: Teacher.all.sample, skill: Skill.all.sample)
end

puts "Teacher skills generated"

# puts "Assigning Teacher to User"
# teachers = Teacher.all
# User.all.each do |user|
#   teachers.find(user.id).user_id = user.id
# end

puts "Finished seeding database"

puts "Create test users"
j = User.new(email: "j@j.j", password: "jjjjjj")
j.save!

w = User.new(email: "w@w.w", password: "wwwwww")
w.save!

o = User.new(email: "o@o.o", password: "oooooo")
o.save!

h = User.new(email: "h@h.h", password: "hhhhhh")
h.save!

Teacher.new(user_id: j.id, hourly_price: Faker::Number.number(3), available_from: Date.today, available_to: (Date.today + rand(100))).save!

Teacher.new(user_id: w.id, hourly_price: Faker::Number.number(3), available_from: Date.today, available_to: (Date.today + rand(100))).save!

Teacher.new(user_id: o.id, hourly_price: Faker::Number.number(3), available_from: Date.today, available_to: (Date.today + rand(100))).save!

Teacher.new(user_id: h.id, hourly_price: Faker::Number.number(3), available_from: Date.today, available_to: (Date.today + rand(100))).save!

puts "Create Bookings for test users"

Booking.new(user_id: j.id, teacher_id: w.id, status: "pending").save!
Booking.new(user_id: j.id, teacher_id: o.id, status: "pending").save!
Booking.new(user_id: j.id, teacher_id: h.id, status: "pending").save!

Booking.new(user_id: w.id, teacher_id: j.id, status: "pending").save!
Booking.new(user_id: w.id, teacher_id: o.id, status: "pending").save!
Booking.new(user_id: w.id, teacher_id: h.id, status: "pending").save!

Booking.new(user_id: o.id, teacher_id: j.id, status: "pending").save!
Booking.new(user_id: o.id, teacher_id: w.id, status: "pending").save!
Booking.new(user_id: o.id, teacher_id: h.id, status: "pending").save!

Booking.new(user_id: h.id, teacher_id: j.id, status: "pending").save!
Booking.new(user_id: h.id, teacher_id: o.id, status: "pending").save!
Booking.new(user_id: h.id, teacher_id: w.id, status: "pending").save!
