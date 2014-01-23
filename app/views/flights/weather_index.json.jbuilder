json.array!(@mars_weather) do |entry|
  json.extract! entry, :id, :terrestrial_date,:sol, :ls, :min_temp, :min_temp_fahrenheit, :max_temp, :max_temp_fahrenheit, :pressure, :pressure_string, :abs_humidity, :wind_speed, :wind_direction, :atmo_opacity, :season, :created_at, :updated_at, :sunrise, :sunset
  json.url weather_index_url(entry, format: :json)
end

