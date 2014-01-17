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
    @flights = Flight.search_results(params[:origin], params[:destination], params[:sort])
  end

  private

  def search_params
    params.require(:flight).permit(:search_destination, :search_origin, :sort)
  end
end
