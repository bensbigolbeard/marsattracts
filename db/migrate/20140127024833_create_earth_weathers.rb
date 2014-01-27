class CreateEarthWeathers < ActiveRecord::Migration
  def change
    create_table :earth_weathers do |t|
      t.string :origin
      t.integer :time
      t.string :summary
      t.string :icon
      t.integer :sunriseTime
      t.integer :sunsetTime
      t.float :moonPhase
      t.float :precipIntensity
      t.float :precipIntensityMax
      t.float :precipProbability
      t.float :temperatureMin
      t.integer :temperatureMinTime
      t.float :temperatureMax
      t.integer :temperatureMaxTime
      t.float :apparentTemperatureMin
      t.integer :apparentTemperatureMinTime
      t.float :apparentTemperatureMax
      t.integer :apparentTemperatureMaxTime
      t.float :dewPoint
      t.float :humidity
      t.float :windSpeed
      t.integer :windBearing
      t.float :visibility
      t.float :cloudCover
      t.float :pressure

      t.timestamps
    end
  end
end
