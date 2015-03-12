class Route < ActiveRecord::Base
  
  # # For Geocoder
  # geocoded_by :start_name, :latitude =>:start_latitude, :longitude => :start_longitude

  # geocoded_by :end_name, :latitude => :end_latitude, :longitude => :end_longitude

  # # Validation
  # after_validation :geocode

  # Relationship
  has_many :fares

  def full_route
    self.start_name+" --- "+self.end_name
  end

end