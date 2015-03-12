class Admin::RoutesController < AdminController
  
  before_action :look_ups, :only => [:edit, :update, :show, :destroy]

  def index
    @routes = Route.select("id,start_name,end_name").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @route = Route.new
  end

  def show
  end

  def edit
  end

  def update
    @route = Route.find(params[:id])
    respond_to do |format|
      if @route.update(route_params)
        format.js { render :update }
      else
        format.html { render :edit }
        format.js { render :error }
      end
    end
  end

  def create
    @start_name = params[:route][:start_name]
    @end_name = params[:route][:end_name]

    start_coords = Geocoder.coordinates(@start_name)
    end_coords = Geocoder.coordinates(@end_name)

    @route = Route.new(route_params)

    # Parameters 
    @route.start_latitude = start_coords[0]
    @route.start_longitude = start_coords[1]
    @route.end_latitude = end_coords[0]
    @route.end_longitude = end_coords[1]
    
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
    params.require(:route).permit(:start_name, :end_name, :start_latitude, :start_longitude, :end_latitude, :end_longitude, :no_of_way)
    # params.require(:route).permit(:start_name, :end_name, :start_latitude, :start_longitude, :end_latitude, :end_longitude, :no_of_way, :route_distance, :encoded_polyline, :encoded_level)
  end
end