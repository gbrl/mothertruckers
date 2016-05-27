require 'active_record'
require 'active_support/all'
require './app/models/truck'
# Add new app/ and lib/ files here when they are created.

module AppConfig

  def self.establish_connection
    puts "Connecting to database..."
      ActiveRecord::Base.establish_connection(
      adapter:  "postgresql",
      host:     "ec2-54-163-230-90.compute-1.amazonaws.com",
      username: "ucmocwstzaxduv",
      password: "wfx8En3oykmS2__gOkW7j_zLBG",
      database: "d74a2i8lmqp2et")
  end
end
