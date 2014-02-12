# Extracts the JSON from the Origin database, as called in the controller
json.array!(@origins) do |origin|
  json.extract! origin, :id, :origin, :lat, :long
  json.url origins_url(origin, format: :json)
end