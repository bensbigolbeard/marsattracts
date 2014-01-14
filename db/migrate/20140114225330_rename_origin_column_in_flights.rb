class RenameOriginColumnInFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :origin
  end
end
