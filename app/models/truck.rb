class Truck < ActiveRecord::Base
  before_save :make_slug

  has_many :notes, dependent: :destroy
  has_many :users, through: :favourites
  has_many :stops, dependent: :destroy
  has_many :ratings

  private

  def make_slug
    self.slug = self.name.downcase.gsub(" ","-").gsub(".","").gsub("&","and").gsub("/","").gsub("?","").gsub("'","")
  end

  def self.open
    Truck.all.map { |t| t.stops.length > 0 }
  end

end
