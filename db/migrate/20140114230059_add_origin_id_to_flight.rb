class AddOriginIdToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :origin_id, :integer
  end
end
