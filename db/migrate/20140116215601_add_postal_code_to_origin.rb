class AddPostalCodeToOrigin < ActiveRecord::Migration
  def change
    add_column :origins, :postal_code, :string
  end
end
