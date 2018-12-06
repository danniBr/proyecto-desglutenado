require 'faker'

AdminUser.destroy_all
Recipe.destroy_all
Location.destroy_all
Comment.destroy_all
Question.destroy_all
User.destroy_all

5.times do |i|
  User.create!(
    name: "usuario-#{i}",
    email: "usuario#{i}@gmail.com",
    password: "123456"
  )
end

5.times do |i|
  Recipe.create!(
    title: Faker::Food.dish,
    photo: open("https://loremflickr.com/600/400/recipe/"),
    cant: 1+i,
    ingredients: Faker::Food.ingredient,
    directions: Faker::Lorem.paragraph(2),
    user: User.first
  )
end

5.times do |i|
  Question.create!(
    title: Faker::Lorem.paragraph(1),
    description: Faker::Lorem.paragraph(10),
    user: User.last
  )
end

5.times do |i|
  Location.create!(
    title: Faker::Lorem.paragraph(1),
    description: Faker::Lorem.paragraph(10),
    location: Faker::Address.full_address,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    user: User.last
  )
end

5.times do |i|
  Comment.create!(
    user: User.last,
    question: Question.last,
    comment: Faker::Lorem.paragraph(10)
  )
end

AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password') if Rails.env.development?
