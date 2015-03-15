class JeepneyFare < ActiveRecord::Base

  # Relationship
  belongs_to :jeepney_route
  
end