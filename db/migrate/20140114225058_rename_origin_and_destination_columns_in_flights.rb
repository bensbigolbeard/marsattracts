class RenameOriginAndDestinationColumnsInFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :destination
  end
end
