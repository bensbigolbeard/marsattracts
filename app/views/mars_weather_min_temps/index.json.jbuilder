json.array!(@mars_weather) do |weather|
  json.extract! weather, :min_temp_fahrenheit
end