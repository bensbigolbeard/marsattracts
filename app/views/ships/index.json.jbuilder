json.array!(@ships) do |ship|
  json.extract! ship, :id, :name, :speed, :capacity
  json.url ships_url(ship, format: :json)
end