class Venue < ActiveRecord::Base
  belongs_to :organization
  belongs_to :event
 
  validates_presence_of :name
  
  attr_accessible :name, :address1, :address2, :city, :state, :zip, :time_zone
  
  def street_as_string
    str = (address1 || "") + " " + (address2 || "")
    str.strip
  end
  
  def city_state_zip_as_string
    str = (city || "") + " " + (state || "") + " " + (zip || "")
    str.strip
  end
  
  def address_as_url_query
    URI::escape(street_as_string + " " + city_state_zip_as_string)
  end
end