require "spec_helper"

describe Trip do 
  it "returns the total trip price" do
    flight = Flight.new(price: 5)
    amenity = 5
    # What arguments to pass in when making new trip?
    trip = Trip.new(passenger_id: 1, flight_id: flight.id)
    trip.price = flight.price + amenity
    expect(trip.total_price).to eq trip.price
  end
end


