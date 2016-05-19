
require 'net/http'
require 'pp'
require 'open-uri'
require 'json'
require 'active_record'
require 'active_support/all'
require_relative 'app_config'
require_relative 'app/models/truck'

def process_file

  AppConfig.establish_connection

  uri = URI("http://foodtruckreporter.com/api/food-trucks/trucks?access_token=566f92c903d8405f82490fcbdfad62b3&format=json&limit=1000&city=4")
  resp = Net::HTTP.get_response(uri)
  hash = JSON(resp.body)
  parse(hash)

end

def parse(hash)

  trucks = hash['objects']

  trucks.each do |e| 
    new_truck = Truck.new(
      name: e["name"],
      description: e["description_stripped"],
      email: e["email"],
      website: e["site_url"],
      cuisine: e["cuisine"],
      image: e["main_image"],
      image_small: e["main_image_thumbnail"],
      image_large: e["main_image_large"])

    if new_truck.save!
      if e["stop_details"] && e["stop_details"].length > 0
        e["stop_details"].each do |stop|
          Stop.create(
          truck_id: new_truck.id,
          name: stop["name"],
          from: stop["from"],
          latitude: stop["latitude"],
          longitude: stop["longitude"],
          to: stop["to"])
        end
      end
    end
  end
end

process_file
