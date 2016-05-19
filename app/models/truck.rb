class Truck < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites
end
