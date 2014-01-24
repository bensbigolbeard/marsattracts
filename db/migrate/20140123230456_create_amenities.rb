class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.string :activity
      t.integer :price
      t.string :description
      t.string :img_url

      t.timestamps
    end
  end
end
