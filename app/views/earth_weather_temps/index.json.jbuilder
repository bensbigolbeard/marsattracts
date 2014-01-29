json.array!(@earth_weather) do |weather|
  json.extract! weather, :origin, :temperatureMin, :temperatureMax
end