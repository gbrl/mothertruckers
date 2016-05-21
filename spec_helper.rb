require 'rspec'
require 'active_record'
require 'pry'
require 'byebug'

# Include debugging tools by default so that you don't have to add them.

require './app_config'
require './app/models/truck'
require './app/models/address'
require './app/models/rating'
require './app/models/user'
require './app/models/favourite'
require './app/models/note'
require './app/models/stop'

AppConfig.establish_connection
