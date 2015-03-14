class Api::RoutesController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@routes = Route.all)
  end

  def show
    respond_with(@routes = Route.where("id =?", params[:id])) 
  end
  
end