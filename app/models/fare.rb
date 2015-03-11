class Fare < ActiveRecord::Base

  # Relationship
  belongs_to :route
  
end