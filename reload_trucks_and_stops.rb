
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

def process_ajax_data

  puts "Connecting to API..."
  AppConfig.establish_connection

  uri = URI("http://foodtruckreporter.com/api/food-trucks/trucks?access_token=566f92c903d8405f82490fcbdfad62b3&format=json&limit=1000&city=4")
  resp = Net::HTTP.get_response(uri)
  hash = JSON(resp.body)
  parse(hash)

end

def parse(hash)

  trucks = Truck.all
  trucks.each do |t|
    t.destroy
  end

  stops = Stop.all
  stops.each do |s|
    s.destroy
  end

  puts "Creating database entries..."
  trucks = hash['objects']

  trucks.each do |e| 
    puts "Adding truck..."

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
          puts "Adding truck stop..."
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
    puts "#{new_truck.name} was added."
  end
end

process_ajax_data
