
require 'net/http'
require 'pp'
require 'open-uri'
require 'json'
require 'active_record'
require 'active_support/all'
require_relative 'app_config'
require_relative 'app/models/truck'
require_relative 'app/models/stop'
require_relative 'app/models/user'
require_relative 'app/models/note'
require_relative 'app/models/favourite'
require_relative 'app/models/rating'

def process_file

  puts "Connecting to API..."
  AppConfig.establish_connection

  uri = URI("http://foodtruckreporter.com/api/food-trucks/trucks?access_token=566f92c903d8405f82490fcbdfad62b3&format=json&limit=1000&city=4")
  resp = Net::HTTP.get_response(uri)
  hash = JSON(resp.body)
  parse(hash)

end

def parse(hash)

  puts "Creating database entries..."
  trucks = hash['objects']

  trucks.each do |e| 

    secure_img_url = e["main_image"].gsub!("http","https")
    puts "New secure image url is: #{secure_img_url}"
    
    new_truck = Truck.new(
      name: e["name"],
      description: e["description_stripped"],
      email: e["email"],
      website: e["site_url"],
      cuisine: e["cuisine"],
      image: secure_img_url,
      image_small: e["main_image_thumbnail"],
      image_large: e["main_image_large"])

    if new_truck.save!
      if e["stop_details"] && e["stop_details"].length > 0
        e["stop_details"].each do |stop|
          Stop.create(
          truck_id: new_truck.id,
          name: stop["name"],
          from: stop["from"],
          latitude: stop["location"]["latitude"].to_f,
          longitude: stop["location"]["longitude"].to_f,
          to: stop["to"])
        end
      end
    end
  end

puts "Creating users..."
User.create(email: "taco@lover.com", password: "hungry")
User.create(email: "burger@lover.com", password: "hungry")
User.create(email: "poutine@lover.com", password: "hungry")
User.create(email: "food@lover.com", password: "hungry")


# Create favourites for taco@lover.com
# These trucks all serve tacos
puts "Creating favourites..."
Favourite.create(user_id: 1, truck_id: 30)
Favourite.create(user_id: 1, truck_id: 26)
Favourite.create(user_id: 1, truck_id: 18)
Favourite.create(user_id: 1, truck_id: 4)
Favourite.create(user_id: 1, truck_id: 36)
Favourite.create(user_id: 1, truck_id: 69)
Favourite.create(user_id: 1, truck_id: 68)
Favourite.create(user_id: 1, truck_id: 89)
Favourite.create(user_id: 1, truck_id: 91)
Favourite.create(user_id: 1, truck_id: 50)


puts "Creating notes..."
Note.create(user_id: 1, truck_id: 30, content: "So spicy, don't add any hot sauce!")
Note.create(user_id: 1, truck_id: 26, content: "Arctic Char tacos?! Yes please!")
Note.create(user_id: 1, truck_id: 18, content: "Super cute staff here and they have tequila. Shhhhh.....")
Note.create(user_id: 1, truck_id: 4, content: "Out-of-this-world pork tacos. Mango avocado salsa was so good I need to steal the recipe.")
Note.create(user_id: 1, truck_id: 36, content: "Sweet old lady who always gives me a free churro!")
Note.create(user_id: 1, truck_id: 69, content: "So much cheesey goodness, must stalk this one more.")
Note.create(user_id: 1, truck_id: 68, content: "I would marry this truck if it were legal.")
Note.create(user_id: 1, truck_id: 89, content: "A+ 100 PERCENT authentic mexican style tacos!")
Note.create(user_id: 1, truck_id: 91, content: "Guy is super rude, but he makes a mean taco... Kinda torn...")
Note.create(user_id: 1, truck_id: 50, content: "Cheap and delicious. They need to open a brick-and-mortar location.")

puts "Creating ratings...."
Rating.create(user_id: 2, truck_id: 30, score: 2)
Rating.create(user_id: 2, truck_id: 26, score: 2)
Rating.create(user_id: 2, truck_id: 18, score: 2)
Rating.create(user_id: 2, truck_id: 4, score: 2)
Rating.create(user_id: 2, truck_id: 36, score: 3)
Rating.create(user_id: 2, truck_id: 69, score: 2)
Rating.create(user_id: 2, truck_id: 68, score: 2)
Rating.create(user_id: 2, truck_id: 89, score: 5)
Rating.create(user_id: 2, truck_id: 91, score: 5)
Rating.create(user_id: 2, truck_id: 50, score: 5)

Rating.create(user_id: 3, truck_id: 30, score: 2)
Rating.create(user_id: 3, truck_id: 26, score: 1)
Rating.create(user_id: 3, truck_id: 18, score: 1)
Rating.create(user_id: 3, truck_id: 4, score: 5)
Rating.create(user_id: 3, truck_id: 36, score: 5)
Rating.create(user_id: 3, truck_id: 69, score: 3)
Rating.create(user_id: 3, truck_id: 68, score: 2)
Rating.create(user_id: 3, truck_id: 89, score: 1)
Rating.create(user_id: 3, truck_id: 91, score: 2)
Rating.create(user_id: 3, truck_id: 50, score: 2)

Rating.create(user_id: 4, truck_id: 30, score: 2)
Rating.create(user_id: 4, truck_id: 26, score: 2)
Rating.create(user_id: 4, truck_id: 18, score: 5)
Rating.create(user_id: 4, truck_id: 4, score: 1)
Rating.create(user_id: 4, truck_id: 36, score: 2)
Rating.create(user_id: 4, truck_id: 69, score: 3)
Rating.create(user_id: 4, truck_id: 68, score: 5)
Rating.create(user_id: 4, truck_id: 89, score: 3)
Rating.create(user_id: 4, truck_id: 91, score: 2)
Rating.create(user_id: 4, truck_id: 50, score: 2)


end

process_file
