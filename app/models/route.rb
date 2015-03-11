class Route < ActiveRecord::Base

  # For Geocoder
  geocoded_by :start_name, latitude: :start_latitude, longitude: :start_longitude

  geocoded_by :end_name, latitude: :end_latitude, longitude: :end_longitude

  # Validation
  after_validation :geocode, :if => :start_name_changed?

  # Relationship
  has_many :fares
end