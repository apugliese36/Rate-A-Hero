# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Run line 10 to reset database
# rake db:drop && rake db:create && rake db:migrate && rake db:seed

require 'faker'
# Superhero.destroy_all
# Review.destroy_all
#
# Superhero.create(name: "my mom", superpower: "making omelettes", backstory: "brilliant from birth", image_url: "https://image.gala.de/20293706/large1x1-300-300/cdda69fdf0438ee891f6fa44c88b4062/Mr/die-nanny--10220887-.jpg")
# Superhero.create(name: "Antonio", superpower: "sword fighting and a mask", backstory: "super secret all the time", image_url:  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Antonio_Banderas_KVIFF.jpg/1200px-Antonio_Banderas_KVIFF.jpg")
# Superhero.create(name: "Dan", superpower: "CHAINSAW", backstory: "It's a pretty good yarn", image_url:"https://nerdist.com/wp-content/uploads/2017/05/Ongo.jpg" )
# Superhero.create(name: "Jeff", superpower: "wall art and magic", backstory: "I'd rather have a free bottle in front of me than a prefrontal lobotomy.", image_url: "https://www.thesun.co.uk/wp-content/uploads/2016/11/nintchdbpict0002381335901.jpg?w=631")
#
#
#
# Review.create(superhero_id: 1, rating: 3, comment: Faker::HarryPotter.quote)
# Review.create(superhero_id:1, rating: 4, comment: Faker::HarryPotter.quote)
# Review.create(superhero_id:2, rating: 2, comment: Faker::HarryPotter.quote)
# Review.create(superhero_id:2, rating: 3, comment: Faker::HarryPotter.quote)
# Review.create(superhero_id:3, rating: 4, comment: Faker::HarryPotter.quote)
# Review.create(superhero_id:3, rating: 4, comment: Faker::HarryPotter.quote)
# Review.create(superhero_id:3, rating: 4, comment: Faker::HarryPotter.quote)
# Review.create(superhero_id: 4, rating: 4, comment: Faker::HarryPotter.quote)
# Review.create(superhero_id: 4, rating: 4, comment: Faker::HarryPotter.quote)
# Review.create(superhero_id: 4, rating: 3, comment: Faker::HarryPotter.quote)
Superhero.destroy_all
Review.destroy_all
User.destroy_all

blorp = User.create(first_name: "Blorp", last_name: "McGorp", username: "Blorpy", email: "blorp@blorpy.com", password: "secrectPassword", encrypted_password: "secretPassword" )
kylee = User.create(first_name: "kylee", last_name: "a", username: "kjoya", email: "kjoya@gmail.com", password: "secrectPassword", encrypted_password: "secretPassword" )

mom = Superhero.create(user: blorp, name: "my mom", superpower: "making omelettes", backstory: "brilliant from birth", image_url: "https://image.gala.de/20293706/large1x1-300-300/cdda69fdf0438ee891f6fa44c88b4062/Mr/die-nanny--10220887-.jpg")
anto = Superhero.create(user: blorp, name: "Antonio", superpower: "sword fighting and a mask", backstory: "super secret all the time", image_url:  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Antonio_Banderas_KVIFF.jpg/1200px-Antonio_Banderas_KVIFF.jpg")
dan = Superhero.create(user: blorp, name: "Dan", superpower: "CHAINSAW", backstory: "It's a pretty good yarn", image_url:"https://nerdist.com/wp-content/uploads/2017/05/Ongo.jpg" )
jeff = Superhero.create(user: blorp, name: "Jeff", superpower: "wall art and magic", backstory: "I'd rather have a free bottle in front of me than a prefrontal lobotomy.", image_url: "https://www.thesun.co.uk/wp-content/uploads/2016/11/nintchdbpict0002381335901.jpg?w=631")
kyleee = Superhero.create(user: blorp, name: "Kylee", superpower: "Kylee stuff", backstory: "You don't wanna know", image_url: "http://www.davidwenzel.com/images/childrens/littlebear/FB-Flipping-pancakes.jpg")
sebastian = Superhero.create(user: blorp, name: "Sebastian", superpower: "Always hungry", backstory: "He's gone", image_url: "http://s1.r29static.com//bin/entry/746/x,80/1702405/image.jpg")
dave = Superhero.create(user: blorp, name: "Davey", superpower: "Bumming Uber rides from strange ladies in bars", backstory: "Locking himself out of the office", image_url: "https://i.ytimg.com/vi/EVCrmXW6-Pk/maxresdefault.jpg")

Review.create(user: blorp, creator_username: blorp.username,  superhero: dave, rating: 3, comment: Faker::HarryPotter.quote)
Review.create(user: blorp, creator_username: blorp.username,  superhero: sebastian, rating: 3, comment: Faker::HarryPotter.quote)
Review.create(user: blorp, creator_username: blorp.username,  superhero: kyleee, rating: 3, comment: Faker::HarryPotter.quote)
Review.create(user: blorp, creator_username: blorp.username,  superhero: mom, rating: 3, comment: Faker::HarryPotter.quote)
Review.create(user: blorp, creator_username: blorp.username, superhero: mom, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: kylee, creator_username: kylee.username, superhero: anto, rating: 2, comment: Faker::HarryPotter.quote)
Review.create(user: kylee, creator_username: kylee.username, superhero: anto, rating: 3, comment: Faker::HarryPotter.quote)
Review.create(user: blorp, creator_username: blorp.username, superhero: dan, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: kylee, creator_username: kylee.username, superhero: dan, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: blorp, creator_username: blorp.username, superhero: jeff, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: kylee, creator_username: kylee.username, superhero: jeff, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: blorp, creator_username: blorp.username, superhero: anto, rating: 4, comment: Faker::HarryPotter.quote)
Review.create(user: kylee, creator_username: kylee.username, superhero: mom, rating: 3, comment: Faker::HarryPotter.quote)
