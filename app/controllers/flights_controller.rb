class FlightsController < ApplicationController


  def index
    @user = User.new
    @flights = Flight.all
       render json: @flight, status: 201

  end

  def show

    @flight_rides = FlightRide.new
    @user = current_user
    @flight = Flight.find(params[:id])
    respond_to do |f|

      # f.html 
      f.json {render  json: @flight}

    end

  end


   def new
    @flight = Flight.new
    render 'flights/new'
   end

   def create
    @flight = Flight.create(flight_params)
    
    if @flight.save
        @flight = Flight.create(flight_params)       
        f.json {render  json: @flight}
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
    


 private   
   def flight_params
    params.require(:flight).permit(:inspection, :fuel_cost, :destination, :flight_departure, :flight_sit, :user_id)
  end 

end
