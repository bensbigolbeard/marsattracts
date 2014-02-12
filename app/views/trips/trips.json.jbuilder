# Extracts the JSON from the Trip database, as called in the controller
json.array!(@trips) do |trip|
  json.extract! trip, :id, :passenger_id, :flight_id
  json.url trips_url(trip, format: :json)
end