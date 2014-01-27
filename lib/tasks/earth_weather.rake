namespace :earth_weather do
  desc "scrape the earth weather api into our db"
  task scrape: :environment do

    ForecastIO.api_key = ENV['FORECAST_IO_KEY']

    cities = [{ lat: 30.2676, long: -97.7430, name: "Austin" }, { lat: 34.0535, long: -118.2453, name: "Los Angeles" }, { lat: 31.2304, long: 121.4749, name: "Shanghai" }, { lat: 35.6832, long: 139.8089, name: "Tokyo" }, { lat: 41.8843, long: -87.6324, name: "Chicago" }]

    time = Time.now

    cities.each do |city|

      i = 52

      while i > 0

        forecast = ForecastIO.forecast(city[:lat], city[:long], time: Chronic.parse("#{i} weeks ago").to_i)

        weather_hash = forecast.daily.data[0]

        EarthWeather.create(
          time: weather_hash[:time], 
          summary: weather_hash[:summary],
          icon: weather_hash[:icon],
          sunriseTime: weather_hash[:sunriseTime],
          sunsetTime: weather_hash[:sunsetTime],
          moonPhase: weather_hash[:moonPhase],
          precipIntensity: weather_hash[:precipIntensity],
          precipIntensityMax: weather_hash[:precipIntensityMax],
          precipProbability: weather_hash[:precipProbability],
          temperatureMin: weather_hash[:temperatureMin],
          temperatureMinTime: weather_hash[:temperatureMinTime],
          temperatureMax: weather_hash[:temperatureMax],
          temperatureMaxTime: weather_hash[:temperatureMaxTime],
          apparentTemperatureMin: weather_hash[:apparentTemperatureMin],
          apparentTemperatureMinTime: weather_hash[:apparentTemperatureMinTime],
          apparentTemperatureMax: weather_hash[:apparentTemperatureMax],
          apparentTemperatureMaxTime: weather_hash[:apparentTemperatureMaxTime],
          dewPoint: weather_hash[:dewPoint],
          humidity: weather_hash[:humidity],
          windSpeed: weather_hash[:windSpeed],
          windBearing: weather_hash[:windBearing],
          visibility: weather_hash[:visibility],
          cloudCover: weather_hash[:cloudCover],
          pressure: weather_hash[:pressure]
          )

        EarthWeather.last.update(origin: city[:name])

      i -= 1

      end

    end

  end

end
