class Admin::FaresController < AdminController

  before_action :set_fare_id, :only => [:edit, :update, :show, :destroy]
  before_action :look_ups, :only =>[:edit, :update, :new, :create]

  def index
    @fares = Fare.select("id,route_id,total_regular_fare,total_discounted_fare").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @fare = Fare.new
  end

  def create 
    @fare = Fare.new(fare_params)
    if @fare.save
      redirect_to "/admin/fares"
    else
      render :new
    end   
  end

  def show    
  end

  def edit
  end

  def update 
    @fare = Fare.find(params[:id])
    if @fare.update(fare_params)
      redirect_to "/admin/fares", notice: 'Fare was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @fare.destroy
    redirect_to action: :index
  end

  def matrix
    puts ">>>>>>>>>>>>>>"
    @routes = Route.select("regular_fare, discounted_fare").where("route_id =?", params[:route_id])
  end

  private

  def set_fare_id
    @fare = Fare.find(params[:id])
  end

  def look_ups
    @routes = Route.select("id, start_name, end_name").order("start_name ASC")
  end

  def fare_params
    params.require(:fare).permit(:route_id, :total_regular_fare, :total_discounted_fare, :landmark, :distance)  
  end

end