class ChangeDateOfBirthToDate < ActiveRecord::Migration
  def change
    change_column :passengers, :date_of_birth, :date
  end
end
