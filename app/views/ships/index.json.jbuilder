# Extracts the JSON from the Ship database, as called in the controller
json.array!(@ships) do |ship|
  json.extract! ship, :id, :capacity, :speed, :name, :propulsion, :plating
  json.url ships_url(ship, format: :json)
end