class Admin::FaresController < AdminController

  before_action :look_ups, :only => [:edit, :update, :show, :destroy]
  
  def index
    @fares = Fare.select("id,kilometer,regular_fare, discounted_fare").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @fare = Fare.new
  end

  def show
  end

  def edit
  end

  def update
    @fare = Fare.find(params[:id])
    
    if @fare.update(fare_params)
      redirect_to "/admin/fares"
    else
      render :edit
    end
  end

  def create
    @fare = Fare.new(fare_params)
    if @fare.save
      redirect_to "/admin/fares"
    else
      render :new
    end
  end

  def destroy
    @fare.destroy
    redirect_to action: :index
  end

  private

  def look_ups
    @fare = Fare.find(params[:id])
  end

  def fare_params
    params.require(:fare).permit(:kilometer, :regular_fare, :discounted_fare)
  end
end