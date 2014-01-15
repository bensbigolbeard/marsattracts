class AddDestinationIdToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :destination_id, :integer
  end
end
