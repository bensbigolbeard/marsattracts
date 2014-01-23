class ShipsController < ApplicationController
  def index
    @ships = Ship.all
  end

  def new
  end

  def create
  end

  def show
    @ship = Ship.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
