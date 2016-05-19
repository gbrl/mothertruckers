class Truck < ActiveRecord::Base
  before_save :make_slug

  has_many :notes, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites
  has_many :stops, dependent: :destroy

  private

  def make_slug
    self.slug = self.name.downcase.gsub(" ","-").gsub(".","").gsub("&","and").gsub("/","").gsub("?","")
  end

end
