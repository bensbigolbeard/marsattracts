class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :seat_number

      t.timestamps
    end
  end
end
