# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# if User.create({ email: "admin@gmail.com", name: "Admin", password: "asdasd", level: :admin })
#   puts "Insert admin successful"
# else
#   puts "Insert admin failed"
# end

# 20.times do |i|
#   user = User.create({ email: Faker::Internet.email , name: Faker::Name.name, password: "asdasd", level: :user })

#   if user
#     puts "Insert #{user.name} Successful"
#   else
#     puts "Insert #{user.name} Failed!!"
#   end
# end

# Cek Kesehatan form
users = User.where(level: :user)

users.each do |user|

  if user.answers.create([
    { question_id: 61, value: user.name },
    { question_id: 62, value: Random.rand(34...38) },
    { question_id: 63, option_id: Random.rand(65...68) },
    { question_id: 64, option_id: Random.rand(68...70) },
  ])
    puts "Insert Cek Kesehatan answer by #{user.name} Successful"
  else
    puts "Insert Cek Kesehatan answer by #{user.name} Failed!!"
  end
end

# Daftar Vaksin
users.each do |user|
  if user.answers.create([
    { question_id: 65, value: user.name },
    { question_id: 66, value: Faker::IDNumber.valid },
    { question_id: 67, option_id: Random.rand(70...72) }])
    puts "Insert Daftar Vaksin answer by #{user.name} Successful"
  else
    puts "Insert Daftar Vaksin answer by #{user.name} Failed!!"
  end
end