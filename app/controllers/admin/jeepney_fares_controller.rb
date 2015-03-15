class Admin::JeepneyFaresController < AdminController

  before_action :set_jeepney_fare_id, :only => [:edit, :update, :show, :destroy]
  before_action :look_ups, :only =>[:edit, :update, :new, :create]

  def index
    @jeepney_fares = JeepneyFare.select("id,jeepney_route_id,regular_fare,discounted_fare").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @jeepney_fare = JeepneyFare.new
  end

  def create 
    @jeepney_fare = JeepneyFare.new(fare_params)
    if @jeepney_fare.save
      redirect_to "/admin/jeepney_fares"
    else
      render :new
    end   
  end

  def show    
  end

  def edit
  end

  def update 
    @jeepney_fare = JeepneyFare.find(params[:id])
    if @jeepney_fare.update(fare_params)
      redirect_to "/admin/jeepney_fares", notice: 'JeepneyFare was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @jeepney_fare.destroy
    redirect_to action: :index
  end

  private

  def set_jeepney_fare_id
    @jeepney_fare = JeepneyFare.find(params[:id])
  end

  def look_ups
    @jeepney_routes = JeepneyRoute.select("id, sign_board").order("sign_board ASC")
  end

  def fare_params
    params.require(:jeepney_fare).permit(:jeepney_route_id, :regular_fare, :discounted_fare, :distance)  
  end

end