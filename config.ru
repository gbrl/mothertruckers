# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)
require 'rubygems'
require 'sinatra'
require 'sass'

set :app_file, __FILE__
run Sinatra::Application


# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack
