# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seed start!'

user1 = User.new(email: 'dummy@dummy.com', password: '123456')
user1.save
user2 = User.new(email: 'dummy2@dummy.com', password: '123456')
user2.save
user3 = User.new(email: 'dummy3@dummy.com', password: '123456')
user3.save
user4 = User.new(email: 'dummy4@dummy.com', password: '123456')
user4.save
user5 = User.new(email: 'dummy5@dummy.com', password: '123456')
user5.save

item = Item.new(name: "volunteer rescue")  # item id 1
item.save
item = Item.new(name: "volunteer transport")
item.save
item = Item.new(name: "blanket")
item.save
item = Item.new(name: "tent")
item.save
item = Item.new(name: "clothes")  #5
item.save
item = Item.new(name: "water")
item.save
item = Item.new(name: "rice")
item.save
item = Item.new(name: "miso")
item.save
item = Item.new(name: "fire brigade")
item.save
item = Item.new(name: "ambulance")  #10
item.save

request = Request.new(user_id: 1, type: "relief", address: "somewhere in a disaster zone in meguro-ku", latitude: 35.633942, logitude: 139.708126, status: "open", priority: "medium")
request.save
request = Request.new(user_id: 2, type: "fire", address: "A place closer to meguro-ku", latitude: 35.633842, logitude: 139.708226, status: "open", priority: "high")
request.save
request = Request.new(user_id: 3, type: "rescue", address: "Near Naka Meguro station", latitude: 35.633742, logitude: 139.708199, status: "open", priority: "high")
request.save
request = Request.new(user_id: 4, type: "relief", address: "Down in the meguro river", latitude: 35.633692, logitude: 139.708300, status: "open", priority: "low")
request.save
request = Request.new(user_id: 5, type: "fire", address: "Meguro Police station", latitude: 40.748450, logitude: 35.633802, status: "closed", priority: "high")
request.save
# REQUEST #6 below
request = Request.new(user_id: 6, type: "medical", address: "Bldg opposite Meguro kuyakusho", latitude: 40.748490, logitude: 35.633722, status: "closed", priority: "high")
request.save
request = Request.new(user_id: 7, type: "relief", address: "Same bldg as yakitori restaurant opposite naka meguro station", latitude: 40.748690, logitude: 35.633502, status: "open", priority: "medium")
request.save
request = Request.new(user_id: 8, type: "relief", address: "Near Meguro station, opposite JR exit", latitude: 40.748555, logitude: 35.633444, status: "open", priority: "high")
request.save



# ITEMS_REQUESTS data population
# user=4 requires relief - tents and water
items_request = Items_request.new(item_id: 4, request_id: 4, quantity: 5, status: "open")
items_request.save
items_request = Items_request.new(item_id: 6, request_id: 4, quantity: 25, status: "open")
items_request.save
# user=1 requires rescue help/volunteer AND tents, blankets
items_request = Items_request.new(item_id: 1, request_id: 3, quantity: 6, status: "open")
items_request.save
items_request = Items_request.new(item_id: 4, request_id: 3, quantity: 4, status: "open")
items_request.save
items_request = Items_request.new(item_id: 6, request_id: 3, quantity: 20, status: "open")
items_request.save
# user=2 requires fire help
items_request = Items_request.new(item_id: 9, request_id: 2, quantity: 1, status: "open")
items_request.save
# user=3 requires water, rice, miso, he's still in his apt bldg
items_request = Items_request.new(item_id: 6, request_id: 1, quantity: 35, status: "open")
items_request.save
items_request = Items_request.new(item_id: 7, request_id: 1, quantity: 5, status: "open")
items_request.save
items_request = Items_request.new(item_id: 8, request_id: 1, quantity: 3, status: "open")
items_request.save
# user=5 had a medical emergency which has been dealt with
items_request = Items_request.new(item_id: 10, request_id: 6, quantity: 1, status: "closed")
items_request.save
# user=6 had a medical emergency which has been dealt with
items_request = Items_request.new(item_id: 9, request_id: 5, quantity: 1, status: "closed")
items_request.save
# user=7 requests mutiple things of which some have been proivded
items_request = Items_request.new(item_id: 6, request_id: 7, quantity: 24, status: "closed")
items_request.save
items_request = Items_request.new(item_id: 7, request_id: 7, quantity: 6, status: "closed")
items_request.save
items_request = Items_request.new(item_id: 3, request_id: 7, quantity: 6, status: "open")
items_request.save
items_request = Items_request.new(item_id: 5, request_id: 7, quantity: 12, status: "open")
items_request.save
# user=8 requests mutiple things of which some have been proivded
items_request = Items_request.new(item_id: 2, request_id: 8, quantity: 2, status: "closed")
items_request.save
items_request = Items_request.new(item_id: 6, request_id: 8, quantity: 10, status: "closed")
items_request.save
items_request = Items_request.new(item_id: 7, request_id: 8, quantity: 5, status: "open")
items_request.save
items_request = Items_request.new(item_id: 8, request_id: 8, quantity: 30, status: "open")
items_request.save


puts 'seed end'
