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

  def self.search_results(o, d)
    # origin = Flight.search_origin(o)
    # destination = Flight.search_destination(d)
    origin = Flight.find_all_by_origin_id(o)
    destination = Flight.find_all_by_destination_id(d)
    flights = []

    if origin.length > 1 && destination.length > 1
      destination.each do |dn|
        origin.each do |on|
          if on == dn
            flights << on
          else
            # Nothing! You get nothing!
          end
        end
      end
    elsif origin.length == 1 && destination.length > 1
      destination.each do |dn|
        if origin.first == dn
          flights << origin.first
        else
          # Nothing! You get nothing!
        end    
      end   
    elsif origin.length == 1 && destination.length == 1
      if origin.first == destination.first
        flights << origin.first
      end
    else
      #Nothing! You get Nothing1
    end

    flights
  end

  # Wolfram Alpha API

  def setWolf_query()
    date = self.departure_time.strftime('%m/%d/%Y')
    @query = "distance to mars #{date}".gsub(" ", "%20")
  end

  def setURL
    @wolf_url = "http://api.wolframalpha.com/v2/query?appid=#{ENV['WOLFRAM_APPID']}&input=#{@query}&format=image,plaintext"
  end

  def setNokogiriDoc
    @doc = Nokogiri::HTML(open(@wolf_url))
  end
  
  def setSubpodNode
    @subpod_nodes = @doc.xpath("//queryresult/pod/subpod")
  end


  def getImg() #type must be "au" or "miles"
    setWolf_query()
    setURL()
    setNokogiriDoc()
    setSubpodNode()

    return @subpod_nodes.children[5].values[0] #returns URL string
  end

  def getDistance
    setWolf_query()
    setURL()
    setNokogiriDoc()
    setSubpodNode()

    return @subpod_nodes[1].content
  end
    
    # case distance
    
    # when type == "au"
    #   @subpod_nodes[1].contents
    # when ""
    #   @subpod_nodes[5]


end