class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @origins = Origin.all
    @destinations = Destination.all
    if params[:search_origin].nil?

    else
      redirect_to flights_search_path(:origin => @origin, :destination => @destination)
    end
  end

  def new
  end

  def create
  end

  def show
    ForecastIO.api_key = ENV['FORECAST_IO_KEY']
    @flight = Flight.find(params[:id])
    @ship = @flight.ship
    @lat = @flight.coordinates[0]
    @long = @flight.coordinates[1]
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    # @flight_origins = Flight.search_origin(params[:search_origin])
    # @flight_destinations = Flight.search_destination(params[:search_destination])
    # Params are arrays of id's
    @flights = Flight.search_results(params[:origin], params[:destination])
  end

  private

  def search_params
    params.require(:flight).permit(:search_destination, :search_origin)
  end
end
