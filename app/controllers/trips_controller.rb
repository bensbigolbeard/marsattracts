class TripsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
    @trip = Trip.find_by_passenger_id(params[:id])
  end

  def update
  end

  def destroy
  end
end
