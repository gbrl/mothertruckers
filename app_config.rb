require 'active_record'
require 'active_support/all'
require './app/models/truck'
# Add new app/ and lib/ files here when they are created.

module AppConfig

  def self.establish_connection
    puts "Connecting to database..."
      ActiveRecord::Base.establish_connection(
      adapter:  "postgresql",
      host:     "ec2-23-23-162-78.compute-1.amazonaws.com",
      username: "psdhvloxuowczo",
      password: "dIs_fnNf-KrveKpY_tUavHxKQQ",
      database: "d7l3t7te3413am")
  end
end
