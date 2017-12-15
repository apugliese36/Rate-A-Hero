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
Superhero.destroy_all
Review.destroy_all
User.destroy_all

blorp = User.create(first_name: "Blorp", last_name: "McGorp", username: "Blorpy", email: "blorp@blorpy.com", password: "secretPassword")
kylee = User.create(first_name: "kylee", last_name: "a", username: "kjoya", email: "kjoya@gmail.com", password: "secretPassword")

mom = Superhero.create(user: blorp, name: "my mom", superpower: "making omelettes", backstory: "brilliant from birth", image_url: "https://image.gala.de/20293706/large1x1-300-300/cdda69fdf0438ee891f6fa44c88b4062/Mr/die-nanny--10220887-.jpg")
anto = Superhero.create(user: blorp, name: "Antonio", superpower: "sword fighting and a mask", backstory: "super secret all the time", image_url:  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Antonio_Banderas_KVIFF.jpg/1200px-Antonio_Banderas_KVIFF.jpg")
dan = Superhero.create(user: blorp, name: "Dan", superpower: "CHAINSAW", backstory: "It's a pretty good yarn", image_url:"https://nerdist.com/wp-content/uploads/2017/05/Ongo.jpg" )
jeff = Superhero.create(user: blorp, name: "Jeff", superpower: "wall art and magic", backstory: "I'd rather have a free bottle in front of me than a prefrontal lobotomy.", image_url: "https://www.thesun.co.uk/wp-content/uploads/2016/11/nintchdbpict0002381335901.jpg?w=631")
kyleee = Superhero.create(user: blorp, name: "Kylee", superpower: "Kylee stuff", backstory: "You don't wanna know", image_url: "http://www.davidwenzel.com/images/childrens/littlebear/FB-Flipping-pancakes.jpg")
sebastian = Superhero.create(user: blorp, name: "Sebastian", superpower: "Always hungry", backstory: "He's gone", image_url: "http://s1.r29static.com//bin/entry/746/x,80/1702405/image.jpg")
dave = Superhero.create(user: blorp, name: "Davey", superpower: "Bumming Uber rides from strange ladies in bars", backstory: "Locking himself out of the office", image_url: "https://cdn2.mhpbooks.com/2012/11/hamlet-320x203.png")
mark = Superhero.create(user: kylee, name: "Mark", superpower: "smOKING PIZZA", backstory: "Hard living", image_url: "http://static3.businessinsider.com/image/531d29e76da811036f005a7c-1200-667/screen%20shot%202014-03-09%20at%209.11.25%20pm.png")
james = Superhero.create(user: kylee, name: "James", superpower: "LOUD NOISES", backstory: "whatwg-fetch", image_url: "https://lumiere-a.akamaihd.net/v1/images/porg-main_16933d3b.jpeg?region=0%2C16%2C1560%2C781")
christina = Superhero.create(user: kylee, name: "Christina", superpower: "The full backing of the U.S. dept of defense", backstory: "classfied", image_url: "http://1.bp.blogspot.com/-atPpVIjkpMk/VK1xDs6gNtI/AAAAAAAAAGg/N7vLn8wpRC8/s1600/Agent%2BCarter.jpg")
chris = Superhero.create(user: kylee, name: "Chris", superpower: "Got bees on my head, but don't call me a bee-head", backstory: "THE BEES!!!!", image_url: "https://i.ytimg.com/vi/EVCrmXW6-Pk/maxresdefault.jpg")
joe = Superhero.create(user: kylee, name: "Joe", superpower: "ducks", backstory: "Moon man", image_url: "https://i.ytimg.com/vi/ohX7xdgZsOY/hqdefault.jpg")
bacon = Superhero.create(user: kylee, name: "Bacon", superpower: "destroying the toilet on the left", backstory: "all day long", image_url: "http://nj1015.com/files/2012/09/Bacon-Costume-300x234.png")
tim = Superhero.create(user: kylee, name: "Tim", superpower: "slippers", backstory: "born at LAUNCH, die at launch", image_url: "https://orig00.deviantart.net/2666/f/2017/075/1/a/dva_by_ninovecia-db2iah6.jpg")
paul = Superhero.create(user: kylee, name: "Paulrus", superpower: "chug-a-lug", backstory: "beer in hand, both hands", image_url: "https://www.nationalgeographic.com/content/dam/animals/thumbs/rights-exempt/mammals/w/walrus_thumb.JPG")
alan = Superhero.create(user: kylee, name: "Alan", superpower: "too cool for schools", backstory: "dance dance dance", image_url: "https://fsmedia.imgix.net/9a/f6/b4/72/f6ac/4e64/a681/171e4e91fb7c/galaxy-quest-alan-rickman.jpeg?rect=0%2C253%2C1264%2C632&auto=format%2Ccompress&w=650")

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
