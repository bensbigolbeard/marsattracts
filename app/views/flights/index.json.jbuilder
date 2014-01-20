json.array!(@flights) do |flight|
  json.extract! flight, :id, :flight_number, :duration, :origin_id, :destination_id, :distance, :departure_time, :arrival_time, :ship_id, :price
  json.url flights_url(flight, format: :json)
end