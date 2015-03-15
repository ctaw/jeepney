class JeepneyRoute < ActiveRecord::Base
  
  # Relationship
  belongs_to :route
  has_many :jeepney_fares

end