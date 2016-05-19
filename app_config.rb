require 'active_record'
require 'active_support/all'
require './app/models/truck'
# Add new app/ and lib/ files here when they are created.

module AppConfig

  DATABASE_PATH = File.absolute_path("db/db.sqlite3", File.dirname(__FILE__))

  # ActiveRecord::Base.logger = Logger.new(STDOUT)

  def self.establish_connection
    puts "Connecting to database"
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: DATABASE_PATH,
      # min_messages: 'error'
    )
  end

end
