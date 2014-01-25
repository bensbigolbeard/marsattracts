class Trip < ActiveRecord::Base
  belongs_to :flight
  belongs_to :passenger
  has_many :trip_amenities
  has_many :amenities, through: :trip_amenities

  def total_price 
    Flight.find(flight_id).price
  end

  
  
end
