class Stop < ActiveRecord::Base
  belongs_to :truck

  def self.open
    open_stops = []
    stops = Stop.all
      stops.each do |stop|
        if ((stop.from < Time.now) && (stop.to > Time.now))
          open_stops << stop
        end
      end
    return open_stops
  end

  def escaped_lat_lng
    address = "#{latitude.to_s},#{longitude.to_s}"
  end

end
