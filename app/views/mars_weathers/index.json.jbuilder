json.array!(@mars_weather) do |weather|
  json.extract! weather, :terrestrial_date, :min_temp_fahrenheit

  # , :max_temp_fahrenheit
end