class Api::JeepneyRoutesController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@jeepney_routes = JeepneyRoute.select("*").joins(:route))
  end

  def show
    # respond_with(@jeepney_routes = JeepneyRoute.where("route_id =?", params[:id])) 
    respond_with(@jeepney_routes = JeepneyRoute.select("*").joins(:route).where(:jeepney_routes => {:route_id => params[:id]}))
  end
  
end