class Admin::OfficialFaresController < AdminController

  before_action :look_ups, :only => [:edit, :update, :show, :destroy]
  
  def index
    @official_fares = OfficialFare.select("id,route_name").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @official_fare = OfficialFare.new
  end

  def show
  end

  def edit
  end

  def update
    @official_fare = OfficialFare.find(params[:id])
    
    if @official_fare.update(fare_params)
      redirect_to "/admin/official_fares"
    else
      render :edit
    end
  end

  def create
    @official_fare = OfficialFare.new(fare_params)
    if @official_fare.save
      redirect_to "/admin/official_fares"
    else
      render :new
    end
  end

  def destroy
    @official_fare.destroy
    redirect_to action: :index
  end

  private

  def look_ups
    @official_fare = OfficialFare.find(params[:id])
  end

  def fare_params
    params.require(:official_fare).permit(:route_name, :link_file)
  end
end