class TripsController < ApplicationController
  respond_to :json

  def index
    @trips = Trip.all
    respond_with(@trips) do |format|
      format.json {render json: @trips.as_json }
    end  
  end

  def new

  end

  def create
    # @flight = Flight.find(1)
    # @new_passenger = @flight.passengers.new
    # @new_passenger.first_name = params[:first_name]
    # @new_passenger.last_name = params[:last_name]
    # @new_passenger.email = params[:email]
    # @new_passenger.phone = params[:phone]
    # @new_passenger.address = params[:address]
    # @new_passenger.emergency_contact = params[:emergency_contact]
    # @new_passenger.date_of_birth = params[:date_of_birth]
    # if @new_passenger.valid?
    #   @new_passenger.save!
    # else
    #   return
    # end
    # respond_with(@new_passenger) do |format|
    #   format.json {render json: @new_passenger.as_json }
    # end  
  end

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

  def destroy
  end
end
