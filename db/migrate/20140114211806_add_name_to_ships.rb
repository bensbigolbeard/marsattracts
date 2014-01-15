class AddNameToShips < ActiveRecord::Migration
  def change
    add_column :ships, :name, :string
  end
end
