class PassengersController < ApplicationController
  respond_to :json
  
  def index
    @passengers = Passenger.all
    respond_with(@passengers) do |format|
      format.json {render json: @passengers.as_json }
    end
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @passenger = @flight.passengers.new
  end

  def create
    @new_passenger = @flight.passengers.new
    @flight = Flight.find(params[:flight_id])
    @passenger = @flight.passengers.create(passenger_params)
    if @passenger.save
      redirect_to edit_trip_path(:id => @passenger.trips.last)
    else
      redirect_to :back
    end
    respond_with(@new_passenger) do |format|
      format.json {render json: @new_passenger.as_json }
    end  
  end

  def show
    @passenger = Passenger.find(params[:id])
    respond_with(@passenger) do |format|
      format.json {render json: @passenger.as_json }
    end
  end

  def edit
  end

  def update
    @trip = Trip.find(params[:id])
    @edit_passenger = @trip.passenger
    if @passenger.update(passenger_params)
      Notifier.pass_confirm.deliver
      redirect_to trip_path
    else
      redirect_to :back
    end
    
    respond_with @edit_passenger do |format|
      format.json {render json: @edit_passenger.as_json }
    end
  end

  def destroy
  end

  private

    def passenger_params
      params.require(:passenger).permit(:first_name, :last_name, :email, :phone, :address, :emergency_contact, :date_of_birth)
    end
end
