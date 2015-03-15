class Api::JeepneyFaresController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@jeepney_fares = JeepneyFare.all)
  end

  def show
    respond_with(@jeepney_fares = JeepneyFare.where("jeepney_route_id =?", params[:id]))
  end

end