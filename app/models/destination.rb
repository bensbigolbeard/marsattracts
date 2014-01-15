class Destination < ActiveRecord::Base
  # include PgSearch
  has_many :flights

  # pg_search_scope :search_destination, against: [:id], using: {tsearch: {dictionary: 'english'}}

  # def self.search_destination(search)
  #   if search
  #     find(:all, :conditions => ['id LIKE ?', 'search'])
  #   else
  #     find(:all)
  #   end  
  # end
end