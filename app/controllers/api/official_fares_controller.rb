class Api::OfficialFaresController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@official_fares = OfficialFare.all.order("id ASC"))
  end

end