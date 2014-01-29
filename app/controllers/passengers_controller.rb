class PassengersController < ApplicationController
  respond_to :json
  
  def index
    @passengers = Passenger.all
    respond_with(@passengers) do |format|

      format.json {render json: @passengers.as_json(:include => [:flights, :trips]) }
    end
  end

  def new
    @flight = Flight.find(params[:id])
    @passenger = @flight.passengers.new
  end

  def create
    @flight = Flight.find(params[:flight_id])

    @new_passenger = @flight.passengers.create!(
      :first_name => params[:first_name], 
      :last_name => params[:last_name], 
      :email => params[:email], 
      :phone => params[:phone], 
      :address => params[:address], 
      :emergency_contact => params[:emergency_contact], 
      :date_of_birth => params[:date_of_birth])


    respond_with(@new_passenger) do |format|
      format.json {render json: @new_passenger.as_json }
    end    
  end

  def show
    @passenger = Passenger.find(params[:id])
    @flight = @passenger.flights
    respond_with(@passenger) do |format|
      format.json {render json: @passenger.as_json(:include => [:flights, :trips]) }
    end
  end

  def edit
    @passenger = Flight.passengers.find(params[:id])
    @flight = @passenger.flights.first
    
  end

  def update
    @flight = Passenger.find(params[:id]).flights.first
    @edit_passenger = @flight.passengers.find(params[:id])
    @edit_passenger.update(
      :first_name => params[:first_name], 
      :last_name => params[:last_name], 
      :email => params[:email], 
      :phone => params[:phone], 
      :address => params[:address], 
      :emergency_contact => params[:emergency_contact], 
      :date_of_birth => params[:date_of_birth])

    respond_with @edit_passenger do |format|
      format.json {render json: @edit_passenger.as_json }
    end
    Notifier.pass_confirm(@edit_passenger).deliver
    
  end

  def destroy
  end

  private

    def passenger_params
      params.require(:passenger).permit(:flight_id, :id, :first_name, :last_name, :email, :phone, :address, :emergency_contact, :date_of_birth)
    end
end
