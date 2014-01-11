class Passenger < ActiveRecord::Base
  validates :email, uniqueness: :true
  validates :first_name, :last_name, :email, :date_of_birth, presence: true

  has_many :trips
  has_many :flights, :through => :trips

  validates :first_name, {presence: true}
  
end
