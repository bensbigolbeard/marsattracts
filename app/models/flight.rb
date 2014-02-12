class Flight < ActiveRecord::Base
  # PgSearch is deprecated: used for initial Rails app, replaced by Angular.js sorting
    # include PgSearch
  require 'forecast_io'

  belongs_to :ship
  has_many :trips
  has_many :passengers, :through => :trips
  belongs_to :origin
  belongs_to :destination

    # pg_search_scope :search_origin, against: [:origin_id], using: {tsearch: {dictionary: 'english'}}, associated_against: {origin: :id}
    # pg_search_scope :search_destination, against: [:destination_id], using: {tsearch: {dictionary: 'english'}}, associated_against: {destination: :id}

  # Search the database of origins for location specific in the SEARCH parameter
  def self.search_origin(search)
    if search
      find(:all, :conditions => ['origin LIKE ?', "%#{search}%"])
    else
      find(:all)
    end  
  end

  # Search the database of destinations for location specific in the SEARCH parameter
  def self.search_destination(search)
    if search
      find(:all, :conditions => ['destination LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  # Sort the search results based on cost, departure date, and duration of trip
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

  # Store the coordinates of departure locations for weather queries; run manually
  def coordinates
    coordinates = []
    coordinates << Origin.find(self.origin_id).lat
    coordinates << Origin.find(self.origin_id).long
    coordinates
  end
  
  # Wolfram Alpha API
  # Lists distance from Earth to Mars at departure date, but since the two planets are in constant motion, this distance quickly becomes irrevlevant. See README for the necessary maths to make this API call relevant again.
  # TO BE REIMPLEMENTED WITH MATHS :-(

  # def setWolf_query()
  #   date = self.departure_time.strftime('%m/%d/%Y')
  #   @query = "distance to mars #{date}".gsub(" ", "%20")
  # end

  # def setURL
  #   @wolf_url = "http://api.wolframalpha.com/v2/query?appid=#{ENV['WOLFRAM_APPID']}&input=#{@query}&format=image,plaintext"
  # end

  # def setNokogiriDoc
  #   @doc = Nokogiri::HTML(open(@wolf_url))
  # end
  
  # def setSubpodNode
  #   @subpod_nodes = @doc.xpath("//queryresult/pod/subpod")
  # end


  # def getImg() #type must be "au" or "miles"
  #   setWolf_query()
  #   setURL()
  #   setNokogiriDoc()
  #   setSubpodNode()

  #   return @subpod_nodes.children[5].values[0] #returns URL string
  # end

  # def getDistance
  #   setWolf_query()
  #   setURL()
  #   setNokogiriDoc()
  #   setSubpodNode()

  #   return @subpod_nodes[1].content
  # end
    
    # case distance
    
    # when type == "au"
    #   @subpod_nodes[1].contents
    # when ""
    #   @subpod_nodes[5]

end
