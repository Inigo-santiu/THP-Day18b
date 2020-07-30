# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all

puts "*"*20
puts "Everything has been destroyed. Muhhaaaaaaaaa"

10.times do
  city_list = City.create!(
    city_name: Faker::Address.city
    #city_name: ["Vancouver", "Victoria", "Vienna", "Vladivostok", "Venice"].sample
  )
end

10.times do
  dogsitter_list = Dogsitter.create!(
    name: Faker::Movies::Lebowski.character,
    dogwalking_style: Faker::Games::HeroesOfTheStorm.class_name,
    city: City.find(rand(City.first.id..City.last.id))
  )
end

20.times do
  dog_list = Dog.create!(
    name: Faker::Games::HeroesOfTheStorm.hero, 
    age: rand(1..15),
    city: City.find(rand(City.first.id..City.last.id))
  )
end

20.times do
  stroll_list = Stroll.create!(
    stroll_location: Faker::Games::HeroesOfTheStorm.battleground,
    stroll_intensity: ["Your dog will find this boring :(", "Your dog will come home with lots of energy left", "Your dog will come home satisfied", "Your dog will love it", "Your dog will sleep well tonight"].sample,
    city: City.find(rand(City.first.id..City.last.id)),
    dogsitter: Dogsitter.find(rand(Dogsitter.first.id..Dogsitter.last.id))
  )
end

20.times do
  JoinTableDogStroll.create(
    dog: Dog.find(rand(Dog.first.id..Dog.last.id)), 
    stroll: Stroll.find(rand(Stroll.first.id..Stroll.last.id)))
end

puts "\n"

puts "Everything has been created, you may begin."