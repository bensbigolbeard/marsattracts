class MarsWeathersController < ApplicationController

  def index
    @mars_weather = MarsWeather.all.order(terrestrial_date: :asc)
  end

end
