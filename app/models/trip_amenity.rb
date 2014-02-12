class TripAmenity < ActiveRecord::Base
  belongs_to :amenity
  belongs_to :trip
end