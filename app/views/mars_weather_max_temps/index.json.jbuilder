json.array!(@mars_weather) do |weather|
  json.extract! weather, :max_temp_fahrenheit
end