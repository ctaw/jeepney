class Api::ListFaresController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@list_fares = ListFare.all)
  end

end