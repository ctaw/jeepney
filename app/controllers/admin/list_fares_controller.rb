class Admin::ListFaresController < AdminController

  before_action :look_ups, :only => [:edit, :update, :show, :destroy]
  
  def index
    @list_fares = ListFare.select("id,kilometer,regular_fare, discounted_fare").
    paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @list_fare = ListFare.new
  end

  def show
  end

  def edit
  end

  def update
    @list_fare = ListFare.find(params[:id])
    
    if @list_fare.update(list_fare_params)
      redirect_to "/admin/list_fares"
    else
      render :edit
    end
  end

  def create
    @list_fare = ListFare.new(list_fare_params)
    if @list_fare.save
      redirect_to "/admin/list_fares"
    else
      render :new
    end
  end

  def destroy
    @list_fare.destroy
    redirect_to action: :index
  end

  private

  def look_ups
    @list_fare = ListFare.find(params[:id])
  end

  def list_fare_params
    params.require(:list_fare).permit(:kilometer, :regular_fare, :discounted_fare)
  end
end