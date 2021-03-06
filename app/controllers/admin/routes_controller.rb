class Admin::RoutesController < AdminController
  
  before_action :look_ups, :only => [:edit, :update, :show, :destroy]

  def index
    @routes = Route.select("id,start_name,end_name,sign_board").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @route = Route.new
    @route.jeepney_routes.build
  end

  def show
  end

  def edit
  end

  def update
    @route = Route.find(params[:id])

   #@start_name = params[:route][:start_name]
   #@end_name = params[:route][:end_name]

   #start_coords = Geocoder.coordinates(@start_name)
   #end_coords = Geocoder.coordinates(@end_name)

   #@route.start_latitude = start_coords[0]
   #@route.start_longitude = start_coords[1]
   #@route.end_latitude = end_coords[0]
   #@route.end_longitude = end_coords[1]
    
    if @route.update(route_params)
      redirect_to "/admin/routes"
    else
      render :edit
    end
  end

  def create
    # @start_name = params[:route][:start_name]
    # @end_name = params[:route][:end_name]

    # start_coords = Geocoder.coordinates(@start_name)
    # end_coords = Geocoder.coordinates(@end_name)

    @route = Route.new(route_params)

    # Parameters 
    # @route.start_latitude = start_coords[0]
    # @route.start_longitude = start_coords[1]
    # @route.end_latitude = end_coords[0]
    # @route.end_longitude = end_coords[1]
    
    if @route.save
      redirect_to "/admin/routes"
    else
      render :new
    end

  end

  def destroy
    @route.destroy
    redirect_to action: :index
  end

  private

  def look_ups
    @route = Route.find(params[:id])
  end

  def route_params
    # params.require(:route).permit(:start_name, :end_name, :start_latitude, :start_longitude, :end_latitude, :end_longitude, :no_of_way, jeepney_routes_attributes: [:id, :route_id, :sign_board, :encoded_polyline, :encoded_level, :landmark, :_destroy])
    params.require(:route).permit(:start_name, :end_name, :start_latitude, :start_longitude, :end_latitude, :end_longitude, :no_of_way, :sign_board, :encoded_polyline, :encoded_level, :landmark, :jeepney_fare, :link_file, :jeepney_direction, jeepney_routes_attributes: [:id, :route_id, :title, :direction, :regular_fare, :discounted_fare, :estimated_time, :_destroy])
  end
end
