class AddFlightIdToTrip < ActiveRecord::Migration
  def change
    add_reference :trips, :flight, index: true
    add_reference :trips, :passenger, index: true
  end
end
