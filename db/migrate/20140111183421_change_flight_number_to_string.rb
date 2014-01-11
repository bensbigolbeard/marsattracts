class ChangeFlightNumberToString < ActiveRecord::Migration
  def change
    change_column :flights, :flight_number, :string
  end
end
