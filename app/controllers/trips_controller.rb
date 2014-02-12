class TripsController < ApplicationController
  respond_to :json

  # Render all Trips from the database as JSON for Angular.js
  def index
    @trips = Trip.all
    respond_with(@trips) do |format|
      format.json {render json: @trips.as_json }
    end  
  end

  # Render the trip with an index of :ID from the Trips database as JSON for Angular.js
  def show
    @trip = Trip.find(params[:id])
    respond_with(@trip) do |format|
      format.json {render json: @trip.as_json }
    end 
  end

  def edit
    @trip = Trip.find_by_passenger_id(params[:id])
    @passenger = Passenger.find(@trip.passenger_id)
    @flight_id = @trip.flight_id
    @passenger_id = @trip.passenger_id
  end

  # Add amenities to a passenger's trip through the use of model associations
  # Render the updated information as JSON for Angular.js
  def update
    @trip = Trip.find_by_passenger_id(params[:id])
    if params[:amenity1_id]
      @trip.amenities << Amenity.find(params[:amenity1_id])
    end
    if params[:amenity2_id]
      @trip.amenities << Amenity.find(params[:amenity2_id])
    end
    if params[:amenity3_id]
      @trip.amenities << Amenity.find(params[:amenity3_id])
    end
    if params[:amenity4_id]
      @trip.amenities << Amenity.find(params[:amenity4_id])
    end
    respond_with(@new_passenger) do |format|
      format.json {render json: @new_passenger.as_json }
    end  
  end

  def new
  end

  def create
  end

  def destroy
  end
end