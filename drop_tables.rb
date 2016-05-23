
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


puts "Connecting to database..."
AppConfig.establish_connection

ActiveRecord::Migration.drop_table(:users)
ActiveRecord::Migration.drop_table(:favourites)
ActiveRecord::Migration.drop_table(:trucks)
ActiveRecord::Migration.drop_table(:stops)
ActiveRecord::Migration.drop_table(:ratings)

