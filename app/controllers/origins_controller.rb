class OriginsController < ApplicationController
  def index
    @origins = Origin.all
  end

  def show
    @origin = Origin.find(params[:id])
  end
end