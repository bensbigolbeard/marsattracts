# Extracts the JSON from the Destinations database, as called in the controller
json.array!(@destinations) do |destination|
  json.extract! destination, :id, :destination
  json.url destinations_url(destination, format: :json)
end