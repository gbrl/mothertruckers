class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :notes, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :trucks, through: :favourites
  has_many :ratings, dependent: :destroy
end
