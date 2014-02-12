# Extracts the JSON from the Earth Weather database, as called in the controller
json.array!(@earth_weather) do |weather|
  json.extract! weather, :origin, :temperatureMin, :temperatureMax
end