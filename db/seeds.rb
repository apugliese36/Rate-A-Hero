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

Superhero.create(name: "my mom", superpower: "making omelettes", backstory: "brilliant from birth", image_url: "https://image.gala.de/20293706/large1x1-300-300/cdda69fdf0438ee891f6fa44c88b4062/Mr/die-nanny--10220887-.jpg")
Superhero.create(name: "Antonio", superpower: "sword fighting and a mask", backstory: "super secret all the time", image_url:  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Antonio_Banderas_KVIFF.jpg/1200px-Antonio_Banderas_KVIFF.jpg")
Superhero.create(name: "Dan", superpower: "CHAINSAW", backstory: "It's a pretty good yarn", image_url:"https://nerdist.com/wp-content/uploads/2017/05/Ongo.jpg" )
Superhero.create(name: "Jeff", superpower: "wall art and magic", backstory: "I'd rather have a free bottle in front of me than a prefrontal lobotomy.", image_url: "https://www.thesun.co.uk/wp-content/uploads/2016/11/nintchdbpict0002381335901.jpg?w=631")



Review.create(superhero_id: 1, rating: 3, comment: Faker::HarryPotter.quote)
Review.create(superhero_id:1, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(superhero_id:2, rating: 2, comment: Faker::HarryPotter.quote)
Review.create(superhero_id:2, rating: 3, comment: Faker::HarryPotter.quote)
Review.create(superhero_id:3, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(superhero_id:3, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(superhero_id:3, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(superhero_id: 4, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(superhero_id: 4, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(superhero_id: 4, rating: 3, comment: Faker::HarryPotter.quote)
