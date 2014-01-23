json.array!(@origins) do |origin|
  json.extract! origin, :id, :origin, :lat, :long
  json.url origins_url(origin, format: :json)
end