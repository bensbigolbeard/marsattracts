class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.integer :speed
      t.integer :capacity

      t.timestamps
    end
  end
end
