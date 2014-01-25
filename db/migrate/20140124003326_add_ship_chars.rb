class AddShipChars < ActiveRecord::Migration
  def change
    add_column :ships, :propulsion, :string
    add_column :ships, :plating, :string
  end
end
