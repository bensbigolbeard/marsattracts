require "spec_helper"

describe Trip do 
  it "returns the total trip price" do
    flight = Flight.create(price: 5)
    amenity = 0
    trip = Trip.new(passenger_id: 1, flight_id: flight.id)
    trip.price = flight.price + amenity
    expect(trip.total_price).to eq trip.price
  end
end


