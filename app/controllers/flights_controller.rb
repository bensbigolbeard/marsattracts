class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @origins = Origin.all
    @chicago_lat = Origin.find_by_origin("Chicago").lat;
    @chicago_long = Origin.find_by_origin("Chicago").long;
    @destinations = Destination.all
    ForecastIO.api_key = ENV['FORECAST_IO_KEY']
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
    @mars_weather = MarsWeather.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @flights = Flight.search_results(params[:origin], params[:destination], params[:sort])
  end

  private

    def search_params
      params.require(:flight).permit(:search_destination, :search_origin, :sort)
    end
end
