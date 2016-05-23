# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)
require 'rubygems'
require 'sinatra'

set :app_file, __FILE__
run Sinatra::Application