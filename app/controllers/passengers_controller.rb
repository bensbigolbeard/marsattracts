class PassengersController < ApplicationController
  respond_to :json
  
  def index
    @passengers = Passenger.all
    respond_with(@passengers) do |format|

      format.json {render json: @passengers.as_json(:include => [:flights, :trips]) }
    end
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @passenger = @flight.passengers.new
  end

  def create
    @flight = Flight.find(1)

    @new_passenger = @flight.passengers.create(
      :first_name => params[:first_name], 
      :last_name => params[:last_name], :email => params[:email], 
      :phone => params[:phone], 
      :address => params[:address], 
      :emergency_contact => params[:emergency_contact], 
      :date_of_birth => params[:date_of_birth])
    if @new_passenger.valid?
      # @new_passenger.save!

    else
      return
    end
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
  end

  def update
    @flight = Trip.find_by_passenger_id(params[:id]).flight
    @edit_passenger = @flight.passengers.find(params[:id])
    @edit_passenger.first_name = params[:first_name]
    @edit_passenger.last_name = params[:last_name]
    @edit_passenger.email = params[:email]
    @edit_passenger.phone = params[:phone]
    @edit_passenger.address = params[:address]
    @edit_passenger.emergency_contact = params[:emergency_contact]
    @edit_passenger.date_of_birth = params[:date_of_birth]
    if @edit_passenger.valid?
      @edit_passenger.update!
      Notifier.pass_confirm.deliver
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
