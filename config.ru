# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)
require 'rubygems'
require 'sinatra'
require 'sass/plugin/rack'

# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

set :app_file, __FILE__
run Sinatra::Application


