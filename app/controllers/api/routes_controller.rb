class Api::RoutesController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@routes = Route.select("start_name, end_name, no_of_way").order("id DESC"))
  end
  
end