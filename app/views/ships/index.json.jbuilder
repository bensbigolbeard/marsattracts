json.array!(@ships) do |ship|
  json.extract! ship, :id, :capacity, :speed, :name
  json.url ships_url(ship, format: :json)
end