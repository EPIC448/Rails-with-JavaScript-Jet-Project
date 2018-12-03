class FlightsController < ApplicationController
  def index
    @user = User.new
    @flights = Flight.new
    @flights = Flight.all
  end

  def show
    @flight_rides = FlightRide.new
    @user = current_user
    @flight = Flight.find(params[:id])
    render 'flights/show'
  end

   # create a new flight

   def new
    @flight = Flight.new
    render 'flights/new'
   end

   def create
    @flight = Flight.create(flight_params)
    
    if @flight.save
      session[:flight_id] = @flight.id 
        redirect_to flight_path(@flight)
    else
      render 'flights/new'
    end

    def edit
      @flight = Flight.find(params[:id])
    end

    # get "/pay_receipts/:id/edit" do
    #   if logged_in?
    #     @pay_receipt = PayReceipt.find_by_id(params[:id]) # slug helps to find by name instaed of ID
    #     erb :"/pay_receipts/edit"
    #   else
    #     redirect to "/login"
    #     end
    # end
   

   end

  def update 
    @flight = Flight.find(params[:id])
    @flight.update(flight_params)
    redirect_to flight_path(@flight)
 end

 private
   # will come handy if want to give people the chance to create there own flight
   
   def flight_params
    params.require(:flight).permit(:inspection, :fuel_cost, :destination, :flight_departure, :flight_sit, :user_id)
  end 

end
