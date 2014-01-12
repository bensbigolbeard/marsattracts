class Trip < ActiveRecord::Base
  belongs_to :flight
  belongs_to :passenger

  def total_price 
    Flight.find(flight_id).price
  end
end
