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
    @route = Route.new(route_params)
    respond_to do |format|
        if @route.save
          format.js { render :create }
        else
          format.js { render :error }
        end
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