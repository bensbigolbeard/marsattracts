class TripsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
    @trip = Trip.find_by_passenger_id(params[:id])
    @passenger = Passenger.find(@trip.passenger_id)
    @flight_id = @trip.flight_id
    @passenger_id = @trip.passenger_id
  end

  def update
  end

  def destroy
  end
end
