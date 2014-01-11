class Flight < ActiveRecord::Base
  belongs_to :ship
  has_many :trips
  has_many :passengers, :through => :trips
end
