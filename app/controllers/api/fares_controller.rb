class Api::FaresController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@fares = Fare.all)
  end

  def show
    respond_with(@fares = Fare.where("route_id =?", params[:id])) 
  end
  
end