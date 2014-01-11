class FlightsController < ApplicationController
  def index
    @flights = Flight.all
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
end
