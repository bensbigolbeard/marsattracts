class Ship < ActiveRecord::Base
  has_many :flights
end