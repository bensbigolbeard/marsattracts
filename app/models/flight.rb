class Flight < ActiveRecord::Base
  belongs_to :ship
  has_many :trips
  has_many :passengers, :through => :trips

  def self.search(search)
    if search
      find(:all, :conditions => ['origin LIKE ?', "%#{search}%"])
    else
      find(:all)
    end  
  end
end
