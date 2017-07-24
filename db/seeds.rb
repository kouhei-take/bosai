# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seed start!'

[
  "Old Foggies Home",
  "Funny Accents Forever",
  "Meguro Lawyers Asso",
  "Cool Frogs Anonymous",
  "Cobol-Programmers Anonymous",
  "Obnoxious Indians United",
].each do |name|
  puts Organization.find_or_create_by!(name: name)
end

# Organization.create!(name: "Old Foggies Home")
# Organization.create!(name: "Funny Accents Forever")
# Organization.create!(name: "Meguro Lawyers Asso")
# Organization.create!(name: "Cool Frogs Anonymous")
# Organization.create!(name: "Cobol-Programmers Anonymous")
# Organization.create!(name: "Obnoxious Indians United")

[
  {first_name: "takashi", last_name: "tamura", email: 'takashi@tamura.com', password: '123456', address: "2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.9353.0938", organization_id: 1},
  {first_name: "pk", last_name: "kapur", email: 'pk@kapur.com', password: '123456', address: "1-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.9353.7838", organization_id: 1},
  {first_name: "boris", last_name: "theSpider", email: 'boris@spider.web', password: '123456', address: "Spiders Web Apts, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "080.2253.0938", organization_id: 2},
  {first_name: "sebastian", last_name: "froggman", email: 'sebastian@goodteacher.org', password: '123456', address: "LeWagon Startup House #4, 4-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.1354.5938", organization_id: 2},
  {first_name: "mariko", last_name: "oike", email: 'mariko.oike@lawyer.io', password: '123456', address: "Notos Meguro Mansion Apt 5, 1-11-3, Meguro, Meguro-ku, Tokyo 153-0061", phone_number: "080.9354.7638", organization_id: 3},
  {first_name: "deebee", last_name: "ooh", email: 'deebee@ooh.earth', password: '123456', address: "Instructors Chair Impact Hub, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3353.0942", organization_id: 4},
  {first_name: "Moe", last_name: "Moon", email: 'moe@moon.org', password: '123456', address: "Impact Hub, 2-11-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3353.1265", organization_id: 1},
  {first_name: "Faat", last_name: "Indian", email: 'Faat@indian.earth', password: '123456', address: "Indian Homes Meguro, 2-12-3, Meguro, Meguro-ku, Tokyo 153-0063", phone_number: "090.3123.0942", organization_id: 5}
].each do |user_params|
  puts user_params
  unless User.find_by(email: user_params[:email].downcase)
    puts User.create!(user_params)
  end
end

Item.create!(name: "volunteer rescue")  # item id 1
Item.create!(name: "volunteer transport")
Item.create!(name: "blanket")
Item.create!(name: "tent")
Item.create!(name: "clothes")  #5
Item.create!(name: "water")
Item.create!(name: "rice")
Item.create!(name: "miso")
Item.create!(name: "fire brigade")
Item.create!(name: "ambulance")  #10

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
