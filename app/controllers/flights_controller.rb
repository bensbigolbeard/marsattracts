class FlightsController < ApplicationController
  def index
    @flights = Flight.search(params[:search])
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
  end

  private

  def search_params
    params.require(:flight).permit(:search)
  end
end
