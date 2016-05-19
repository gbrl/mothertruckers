class TrucksImporter

  def initialize(filename=File.absolute_path('db/data/trucks.csv'))
    @filename = filename
  end

  def import
    field_names = ["name", "description", "email", "website", "cuisine", "creation_date", "image", "image_small", "image_large", "no_longer_in_business", "open_time", "close_time", "latitude", "longitude", "intersection"]
    puts "Importing trucks from '#{@filename}'"
    failure_count = 0
    Truck.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        begin
          Truck.create!(attribute_hash)
          print '.'
        rescue ActiveRecord::UnknownAttributeError
          # puts $!.message
          failure_count += 1
          print '!'
        ensure
          STDOUT.flush
        end
      end
    end
    failures = failure_count > 0 ? "(failed to create #{failure_count} student records)" : ''
    puts "\nDONE #{failures}\n\n"
  end

end
