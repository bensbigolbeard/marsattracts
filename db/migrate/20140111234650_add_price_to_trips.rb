class AddPriceToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :price, :integer
  end
end
