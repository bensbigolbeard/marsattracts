class MarsWeatherMinTempsController < ApplicationController

  def index
    @mars_weather = MarsWeather.order(terrestrial_date: :asc).last(52)
  end

end