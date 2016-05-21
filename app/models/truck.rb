class Truck < ActiveRecord::Base
  before_save :make_slug

  has_many :notes, dependent: :destroy
  has_many :users, through: :favourites
  has_many :stops, dependent: :destroy
  has_many :ratings

  def rating
    rating = self.ratings.average(:score)
  end

  def current_stop
    stop = self.open?
  end

  def escaped_current_stop_lat_lng
    address = ''
    stop = self.open?
    puts stop
    if stop
      address = "#{stop.latitude.to_s},#{stop.longitude.to_s}"
      puts address
    end
    return address
  end

  def self.open
    open_truck_ids = []
    trucks = Truck.all
    trucks.each do |t|
      next if t.stops.count < 1
      t.stops.each do |stop|
          if ((stop.from < Time.now) && (stop.to > Time.now))
            open_truck_ids << stop.truck_id
          end
      end
    end

    @open_trucks = Truck.where(id: open_truck_ids)
  end

  def open?
    response = false
    stops = self.stops
    stop_ids = []
      stops.each do |stop|
        if ((stop.from < Time.now) && (stop.to > Time.now))
          response = stop
        end
      end
    return response
  end
  
  private

  def make_slug
    self.slug = self.name.downcase.gsub(" ","-").gsub(".","").gsub("&","and").gsub("/","").gsub("?","").gsub("'","")
  end

end
