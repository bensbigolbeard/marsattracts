class MarsWeathersController < ApplicationController

  def index
    @mars_weather = MarsWeather.select("terrestrial_date").order(terrestrial_date: :asc)

    respond_to do |format|
      format.json { render json: @mars_weather }
    end
  end

end
