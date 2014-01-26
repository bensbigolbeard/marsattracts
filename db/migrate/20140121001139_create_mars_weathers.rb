class CreateMarsWeathers < ActiveRecord::Migration
  def change
    create_table :mars_weathers do |t|
      t.string :terrestrial_date
      t.integer :sol
      t.integer :ls
      t.integer :min_temp
      t.integer :min_temp_fahrenheit
      t.integer :max_temp
      t.integer :max_temp_fahrenheit
      t.integer :pressure
      t.string :pressure_string
      t.integer :abs_humidity
      t.integer :wind_speed
      t.string :wind_direction
      t.string :atmo_opacity
      t.string :season

      t.timestamps
    end
  end
end
