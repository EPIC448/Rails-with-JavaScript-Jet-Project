class FlightsController < ApplicationController
  def index
    @user = User.new
    @flights = Flight.all
  end

  def show

    @flight_rides = FlightRide.new
    @user = current_user
    @flight = Flight.find(params[:id])
    render 'flights/show'
  end


   def new
    @flight = Flight.new
    render 'flights/new'
   end

   def create
    @flight = Flight.create(flight_params)
    
    if @flight.save
        redirect_to flight_path(@flight)
    else
      render 'flights/new'
    end
  end

    def edit 
      @flight = Flight.find(params[:id])

      if  @current_user 
         redirect_to flight_path
      else
       render 'flights/index'
      end
    end


  def update 
    @flight = Flight.find(params[:id])
    @flight.update(flight_params)
    redirect_to flight_path(@flight)
 end

  def commercial
    @flight = Flight.all
   end
    

    # Display flight that has > 5 sits.





 private
   # will come handy if want to give people the chance to create there own flight
   
   def flight_params
    params.require(:flight).permit(:inspection, :fuel_cost, :destination, :flight_departure, :flight_sit, :user_id)
  end 

end
