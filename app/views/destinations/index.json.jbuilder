json.array!(@destinations) do |destination|
  json.extract! destination, :id, :destination
  json.url destinations_url(destination, format: :json)
end