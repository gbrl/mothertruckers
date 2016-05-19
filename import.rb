
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


    if e["stop_details"] && e["stop_details"].length > 0
      e["stop_details"].each do |stop|
        Stop.create(truck_id: new_truck.id, )
      end
    end

    

  end

end

process_file



####################################################################


# trucks = doc.search('.truck').map

# puts "Found #{all_truck_boxes.count} trucks."
# img_sources = []
# titles = []

# all_truck_boxes.each do |truck|

#    titles << truck.search(".title > a").inner_text
#    img_sources << truck.search("img").attr('src').inner_text.gsub("h=210","h=420").gsub("w=290","w=580")

# end

# pp img_sources
# pp titles