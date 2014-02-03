class EarthWeatherTempsController < ApplicationController

  def index
    @earth_weather = EarthWeather.find(:all, :conditions => ['origin LIKE ?', "%#{"Chicagoland"}%"])
  end

end
