class AddLatAndLongtoOrigin < ActiveRecord::Migration
  def change
    add_column :origins, :lat, :float
    add_column :origins, :long, :float
  end
end
