class Api::FaresController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@fares = Fare.all.order("id ASC"))
  end

end