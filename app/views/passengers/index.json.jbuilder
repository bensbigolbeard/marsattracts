# Extracts the JSON from the Passenger database, as called in the controller
json.array!(@passengers) do |passenger|
  json.extract! passenger, :id, :first_name :last_name :email :phone :address :emergency_contact :date_of_birth
  json.url passengers_url(passenger, format: :json)
end
