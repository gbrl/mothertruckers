require 'builder'

x = Builder::XmlMarkup.new(:target => $stdout, :indent => 1)

x.instruct!

x.declare! :DOCTYPE, :html, :PUBLIC