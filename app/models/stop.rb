class Stop < ActiveRecord::Base
  belongs_to :truck

  def self.open
    open_stops = []
    stops = Stop.all
      stops.each do |stop|
        if ((stop.from > DateTime.now.utc.beginning_of_day
) && (stop.to < DateTime.now.utc.end_of_day
))
          open_stops << stop
        end
      end
    return open_stops
  end

  def escaped_lat_lng
    address = "#{latitude.to_s},#{longitude.to_s}"
  end

end
