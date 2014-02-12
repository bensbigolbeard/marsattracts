# Extracts the JSON from the Amenities database, as called in the controller
json.array!(@amenities) do |amenity|
  json.extract! amenity, :id, :activity, :price, :description, :price, :img_url
  json.url amenities_url(amenity, format: :json)
end