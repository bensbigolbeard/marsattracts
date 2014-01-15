class Origin < ActiveRecord::Base
  # include PgSearch
  has_many :flights  

  # pg_search_scope :search_origin, against: [:id], using: {tsearch: {dictionary: 'english'}}

  # def self.search_origin(search)
  #   if search
  #     find(:all, :conditions => ['id LIKE ?', 'search'])
  #   else
  #     find(:all)
  #   end  
  # end
end