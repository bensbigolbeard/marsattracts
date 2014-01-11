class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :emergency_contact
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
