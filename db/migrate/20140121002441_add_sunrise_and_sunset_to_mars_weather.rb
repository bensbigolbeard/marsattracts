class AddSunriseAndSunsetToMarsWeather < ActiveRecord::Migration
  def change
    add_column :mars_weathers, :sunrise, :string
    add_column :mars_weathers, :sunset, :string
  end
end
