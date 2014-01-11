class PassengersController < ApplicationController

  def index
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @passenger = @flight.passengers.new
  end

  def create
    @flight = Flight.find(params[:flight_id])
    @passenger = @flight.passengers.create(passenger_params)
    if @passenger.save

      redirect_to edit_trip_path(:id => @passenger.trips.last)
    else
      redirect_to :back
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def passenger_params
      params.require(:passenger).permit(:first_name, :last_name, :email, :phone, :address, :emergency_contact, :date_of_birth)
    end
end
