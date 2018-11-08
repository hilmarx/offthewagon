puts "Deleting all users..."
User.destroy_all

puts "Deleting all teachers..."
Teacher.destroy_all

puts "Deleting all bookings..."
Booking.destroy_all

puts "Deleting teacher skills..."
TeacherSkill.destroy_all

puts "Deleting skills..."
Skill.destroy_all

puts "Generating users..."

user_array = []
20.times do
  user_array << User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
end
p user_array

puts "Users generated"
puts "Generating skills..."

Skill.create(name: 'ruby')
Skill.create(name: 'javascript')
Skill.create(name: 'swift')
Skill.create(name: 'c')
Skill.create(name: 'python')

puts "Skills generated"
puts "Generating teachers..."

20.times do |n|
  user = User.find(n + 1)
  Teacher.create!(hourly_price: Faker::Number.number(3), available_from: Date.today, available_to: (Date.today + rand(100)), user: user)
end

puts "Teachers generated"
puts "Generating teacher skills..."

level_array = [1, 2, 3, 4, 5]
20.times do
  TeacherSkill.create(name: Skill.all.sample.name, level: level_array.sample, teacher: Teacher.all.sample, skill: Skill.all.sample)
end

puts "Teacher skills generated"

puts "Finished seeding database"
