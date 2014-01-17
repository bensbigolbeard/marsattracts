class Flight < ActiveRecord::Base
  include PgSearch

  belongs_to :ship
  has_many :trips
  has_many :passengers, :through => :trips
  belongs_to :origin
  belongs_to :destination

  pg_search_scope :search_origin, against: [:origin_id], using: {tsearch: {dictionary: 'english'}}, associated_against: {origin: :id}
  pg_search_scope :search_destination, against: [:destination_id], using: {tsearch: {dictionary: 'english'}}, associated_against: {destination: :id}

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

  def self.search_results(origin, destination, sort = '')
    
    sort_query = ''
    case sort
      when 'price'
        sort_query = 'price ASC'
      when 'date'
        sort_query = 'departure_time DESC'
      when 'duration'
        sort_query = ''
      else
        sort_query
    end

    self.where(origin_id: "#{origin}", destination_id: "#{destination}").order(sort_query)
    
  end

end
