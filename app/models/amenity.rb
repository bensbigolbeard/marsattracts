class Amenity < ActiveRecord::Base
  has_many :trip_amenities
  has_many :trips, through: :trip_amenities
end