# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Superhero.destroy_all
Review.destroy_all
User.destroy_all

blorp = User.create(first_name: "Blorp", last_name: "McGorp", username: "Blorpy", email: "blorp@blorpy.com", password: "secrectPassword", encrypted_password: "secretPassword" )
kylee = User.create(first_name: "kylee", last_name: "a", username: "kjoya", email: "kjoya@gmail.com", password: "secrectPassword", encrypted_password: "secretPassword" )


mom = Superhero.create(user: blorp, name: "my mom", superpower: "making omelettes", backstory: "brilliant from birth", image_url: "https://image.gala.de/20293706/large1x1-300-300/cdda69fdf0438ee891f6fa44c88b4062/Mr/die-nanny--10220887-.jpg")
anto = Superhero.create(user: blorp, name: "Antonio", superpower: "sword fighting and a mask", backstory: "super secret all the time", image_url:  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Antonio_Banderas_KVIFF.jpg/1200px-Antonio_Banderas_KVIFF.jpg")
dan = Superhero.create(user: blorp, name: "Dan", superpower: "CHAINSAW", backstory: "It's a pretty good yarn", image_url:"https://nerdist.com/wp-content/uploads/2017/05/Ongo.jpg" )
jeff = Superhero.create(user: blorp, name: "Jeff", superpower: "wall art and magic", backstory: "I'd rather have a free bottle in front of me than a prefrontal lobotomy.", image_url: "https://www.thesun.co.uk/wp-content/uploads/2016/11/nintchdbpict0002381335901.jpg?w=631")


Review.create(user: blorp, superhero: mom, rating: 3, comment: Faker::HarryPotter.quote)
Review.create(user: blorp, superhero: mom, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: kylee, superhero: anto, rating: 2, comment: Faker::HarryPotter.quote)
Review.create(user: kylee, superhero: anto, rating: 3, comment: Faker::HarryPotter.quote)
Review.create(user: blorp, superhero: dan, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: kylee, superhero: dan, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: blorp, superhero: jeff, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: kylee, superhero: jeff, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: blorp, superhero: anto, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: kylee, superhero: mom, rating: 3, comment: Faker::HarryPotter.quote)
