class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :flight_number
      t.datetime :departure_time
      t.datetime :arrival_time
      t.string :origin
      t.string :destination
      t.string :distance

      t.timestamps
    end
  end
end
