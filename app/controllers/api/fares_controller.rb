class Api::FaresController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@fares = Fare.all)
  end

end