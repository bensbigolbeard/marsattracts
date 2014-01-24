class CreateTripAmenities < ActiveRecord::Migration
  def change
    create_table :trip_amenities do |t|
      t.references :amenity, index: true
      t.references :trip, index: true

      t.timestamps
    end
  end
end
