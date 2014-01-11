class AddShipIdToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :ship_id, :integer
  end
end
