class FlightsController < ApplicationController
  def index
    @chicagoland_lat = Origin.find_by_origin("Chicagoland").lat
    @chicagoland_long = Origin.find_by_origin("Chicagoland").long
    @destinations = Destination.all
    @flights = Flight.all
    @origins = Origin.all
    ForecastIO.api_key = ENV['FORECAST_IO_KEY']
    redirect_to flights_search_path(:origin => @origin, :destination => @destination) unless params[:search_origin].nil?
  end

  def show
    @flight = Flight.find(params[:id])
    @lat = @flight.coordinates[0]
    @long = @flight.coordinates[1]
    @ship = @flight.ship
    ForecastIO.api_key = ENV['FORECAST_IO_KEY']
  end

  def search
    @flights = Flight.search_results(params[:origin], params[:destination], params[:sort])
  end
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def search_params
      params.require(:flight).permit(:search_destination, :search_origin, :sort)
    end
end
