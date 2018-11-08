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

20.times do
  User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
end

puts "Users generated"
puts "Generating skills..."

Skill.create(name: 'ruby')
Skill.create(name: 'javascript')
Skill.create(name: 'swift')
Skill.create(name: 'c')
Skill.create(name: 'python')

puts "Skills generated"
puts "Generating teachers..."

20.times do
  Teacher.create!(hourly_price: Faker::Number.number(3), available_from: Date.today, available_to: (Date.today + rand(100)))
end

puts "Teachers generated"
puts "Generating teacher skills..."

level_array = ['expert', 'beginner', 'intermediate']
20.times do
  TeacherSkill.create(name: Skill.all.sample.name, level: level_array.sample, teacher: Teacher.all.sample, skill: Skill.all.sample)
end

puts "Teacher skills generated"

puts "Finished seeding database"
