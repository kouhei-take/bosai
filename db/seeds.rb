# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
puts 'seed start!'

## From Here: Evacuation_points_load by Kouhei
yml_file = YAML.load_file('db/final_format.yml')
  ## Original Data: https://github.com/yutakikuchi/Data/tree/master/shelter/pref
  ## I convered and reduced data to reduce processing time manually
  ## And I used kakasi lib to get ro-ma ji name
  ## To avoid API request to Google every time, I once run creation to get address from Google API, after that, saved the result in objects.yml
  ## After that I reformated the file to make the last seed file simple.

yml_file.each do |x|
  eva = EvacuationPoint.new(name: x["name"], latitude: x["latitude"], longitude: x["longitude"], address: x["address"] )
  eva.number_of_evacuees = rand(10..100)
  eva.max_evacuees = rand(100..1000)
  eva.save(validate: false) # avoid requesting Google API every time
end
### To Here: Evacuation_points_load by Kouhei


org1 = Organization.new(name: "Old Foggies Home")
org1.save
org2 = Organization.new(name: "Funny Accents Forever")
org2.save
org3 = Organization.new(name: "Meguro Lawyers Asso")
org3.save
org4 = Organization.new(name: "Cool Frogs Anonymous")
org4.save
org5 = Organization.new(name: "Cobol-Programmers Anonymous")
org5.save
org6 = Organization.new(name: "Obnoxious Indians United")
org6.save

#Impact Hub Tokyo latitude, longitude35.6339419,139.7059374


user1 = User.new(first_name: "takashi", last_name: "tamura", email: 'takashi@tamura.com', password: '123456', address: "2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.9353.0938", organization_id: 1)
user1.save
user2 = User.new(first_name: "pk", last_name: "kapur", email: 'pk@kapur.com', password: '123456', address: "1-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.9353.7838", organization_id: 1)
user2.save
user3 = User.new(first_name: "boris", last_name: "theSpider", email: 'boris@spider.web', password: '123456', address: "Spiders Web Apts, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "080.2253.0938", organization_id: 2)
user3.save
user4 = User.new(first_name: "sebastian", last_name: "froggman", email: 'sebastian@goodteacher.org', password: '123456', address: "LeWagon Startup House #4, 4-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.1354.5938", organization_id: 2)
user4.save
user5 = User.new(first_name: "mariko", last_name: "oike", email: 'mariko.oike@lawyer.io', password: '123456', address: "Notos Meguro Mansion Apt 5, 1-11-3, Meguro, Meguro-ku, Tokyo 153-0061", phone_number: "080.9354.7638", organization_id: 3)
user5.save
user6 = User.new(first_name: "deebee", last_name: "ooh", email: 'deebee@ooh.earth', password: '123456', address: "Instructors Chair Impact Hub, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3353.0942", organization_id: 4)
user6.save
user7 = User.new(first_name: "Moe", last_name: "Moon", email: 'moe@moon.org', password: '123456', address: "Impact Hub, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3353.1265", organization_id: 1)
user7.save
user8 = User.new(first_name: "Faat", last_name: "Indian", email: 'Faat@indian.earth', password: '123456', address: "Indian Homes Meguro, 2-12-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3123.0942", organization_id: 5)
user8.save


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

request = Request.new(user_id: 1, category: "relief", address: "somewhere in a disaster zone in meguro-ku", latitude: 35.633942, longitude: 139.708126, status: "open", priority: "medium")
request.save
request = Request.new(user_id: 2, category: "fire", address: "A place closer to meguro-ku", latitude: 35.633842, longitude: 139.708226, status: "open", priority: "high")
request.save
request = Request.new(user_id: 3, category: "rescue", address: "Near Naka Meguro station", latitude: 35.631869, longitude: 139.706703, status: "open", priority: "high")
request.save
request = Request.new(user_id: 4, category: "relief", address: "Down in the meguro river", latitude: 35.633281, longitude: 139.701854, status: "open", priority: "low")
request.save
request = Request.new(user_id: 5, category: "fire", address: "Meguro Police station", latitude: 35.638635, longitude: 139.708012, status: "closed", priority: "high")
request.save
# REQUEST #6 below
request = Request.new(user_id: 6, category: "medical", address: "Bldg opposite Meguro kuyakusho", latitude: 35.632758, longitude: 139.713752, status: "closed", priority: "high")
request.save
request = Request.new(user_id: 7, category: "relief", address: "Same bldg as yakitori restaurant opposite naka meguro station", latitude: 35.637222, longitude: 139.706564, status: "open", priority: "medium")
request.save
request = Request.new(user_id: 8, category: "relief", address: "Near Meguro station, opposite JR exit", latitude: 35.633281, longitude: 139.706564, status: "open", priority: "high")
request.save



# ITEMS_REQUESTS data population
# user=4 requires relief - tents and water
items_request = ItemsRequest.new(item_id: 4, request_id: 4, quantity: 5, status: "open")
items_request.save
items_request = ItemsRequest.new(item_id: 6, request_id: 4, quantity: 25, status: "open")
items_request.save
# user=1 requires rescue help/volunteer AND tents, blankets
items_request = ItemsRequest.new(item_id: 1, request_id: 3, quantity: 6, status: "open")
items_request.save
items_request = ItemsRequest.new(item_id: 4, request_id: 3, quantity: 4, status: "open")
items_request.save
items_request = ItemsRequest.new(item_id: 6, request_id: 3, quantity: 20, status: "open")
items_request.save
# user=2 requires fire help
items_request = ItemsRequest.new(item_id: 9, request_id: 2, quantity: 1, status: "open")
items_request.save
# user=3 requires water, rice, miso, he's still in his apt bldg
items_request = ItemsRequest.new(item_id: 6, request_id: 1, quantity: 35, status: "open")
items_request.save
items_request = ItemsRequest.new(item_id: 7, request_id: 1, quantity: 5, status: "open")
items_request.save
items_request = ItemsRequest.new(item_id: 8, request_id: 1, quantity: 3, status: "open")
items_request.save
# user=5 had a medical emergency which has been dealt with
items_request = ItemsRequest.new(item_id: 10, request_id: 6, quantity: 1, status: "closed")
items_request.save
# user=6 had a medical emergency which has been dealt with
items_request = ItemsRequest.new(item_id: 9, request_id: 5, quantity: 1, status: "closed")
items_request.save
# user=7 requests mutiple things of which some have been proivded
items_request = ItemsRequest.new(item_id: 6, request_id: 7, quantity: 24, status: "closed")
items_request.save
items_request = ItemsRequest.new(item_id: 7, request_id: 7, quantity: 6, status: "closed")
items_request.save
items_request = ItemsRequest.new(item_id: 3, request_id: 7, quantity: 6, status: "open")
items_request.save
items_request = ItemsRequest.new(item_id: 5, request_id: 7, quantity: 12, status: "open")
items_request.save
# user=8 requests mutiple things of which some have been proivded
items_request = ItemsRequest.new(item_id: 2, request_id: 8, quantity: 2, status: "closed")
items_request.save
items_request = ItemsRequest.new(item_id: 6, request_id: 8, quantity: 10, status: "closed")
items_request.save
items_request = ItemsRequest.new(item_id: 7, request_id: 8, quantity: 5, status: "open")
items_request.save
items_request = ItemsRequest.new(item_id: 8, request_id: 8, quantity: 30, status: "open")
items_request.save


puts 'seed end'
