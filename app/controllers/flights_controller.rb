class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @flight_origins = Flight.search_origin(params[:search_origin])
    @flight_destinations = Flight.search_destination(params[:search_destination])
    if params[:search_origin].nil?

    else
      redirect_to flights_search_path(:search_origin => @flight_origins, :search_destination => @flight_destinations)
    end
  end

  def new
  end

  def create
  end

  def show
    @flight = Flight.find(params[:id])
    @ship = @flight.ship
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    # Params are arrays of id's
    @flights = Flight.search_results(params[:search_origin], params[:search_destination])
  end

  private

  def search_params
    params.require(:flight).permit(:search_destination, :search_origin)
  end
end
