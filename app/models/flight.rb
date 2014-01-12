class Flight < ActiveRecord::Base
  include PgSearch

  belongs_to :ship
  has_many :trips
  has_many :passengers, :through => :trips

  pg_search_scope :search_origin, against: [:origin], using: {tsearch: {dictionary: 'english'}}
  pg_search_scope :search_destination, against: [:destination], using: {tsearch: {dictionary: 'english'}}

  def self.search_origin(search)
    if search
      find(:all, :conditions => ['origin LIKE ?', "%#{search}%"])
    else
      find(:all)
    end  
  end

  def self.search_destination(search)
    if search
      find(:all, :conditions => ['destination LIKE ?', "%#{search}%"])
    else
      find(:all)
    end  
  end

  def self.search_results(origin, destination)
    flights = []
    origin.each do |on|
      destination.each do |dn|
        if on == dn
          flights << Flight.find(on)
        else
          # Nothing! You get nothing!
        end
      end
    end
    flights
  end
end