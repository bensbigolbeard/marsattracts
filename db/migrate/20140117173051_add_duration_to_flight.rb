class AddDurationToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :duration, :integer
  end
end
