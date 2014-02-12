# Extracts the JSON from the Mars Weather database, as called in the controller
json.array!(@mars_weather) do |weather|
  json.extract! weather, :min_temp_fahrenheit, :max_temp_fahrenheit
end

