class Passenger < ActiveRecord::Base
  has_many :trips
  has_many :flights, :through => :trips
end
