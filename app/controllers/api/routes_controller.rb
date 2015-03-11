class Api::RoutesController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@routes = Route.all)
  end
  
end