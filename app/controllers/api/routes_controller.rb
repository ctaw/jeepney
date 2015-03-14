class Api::RoutesController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@routes = Route.all)
  end

  def show
    respond_with(@routes = JeepneyRoute.where("route_id =?", params[:id])) 
  end
  
end