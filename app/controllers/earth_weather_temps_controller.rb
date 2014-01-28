class EarthWeatherTempsController < ApplicationController

  def index
    @earth_weather = EarthWeather.find(:all, :conditions => ['origin LIKE ?', "%#{"Chicago"}%"])
  end

end
