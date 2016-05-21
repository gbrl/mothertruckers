class Rating < ActiveRecord::Base
  belongs_to :truck
  belongs_to :user
  validates :score, presence: true
end
