class Route < ActiveRecord::Base
  
  # # For Geocoder
  # geocoded_by :start_name, :latitude =>:start_latitude, :longitude => :start_longitude

  # geocoded_by :end_name, :latitude => :end_latitude, :longitude => :end_longitude

  # # Validation
  # after_validation :geocode

  # Relationship
  has_many :jeepney_routes, :dependent => :destroy
  has_many :fares

  accepts_nested_attributes_for :jeepney_routes, :reject_if => :all_blank, :allow_destroy => true

  def full_route
    self.start_name+" --- "+self.end_name
  end

end