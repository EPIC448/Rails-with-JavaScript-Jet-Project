class FlightsController < ApplicationController
  def index
    @user = User.new
    @flights = Flight.all
    
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @flights}

      # to test just say http://localhost:3000/flights.json
    end
  end

  def show

    @flight_rides = FlightRide.new
    @user = current_user
    @flight = Flight.find(params[:id])
    # render 'flights/show'
  
    respond_to do |f|
      f.html {render :index}
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
        # redirect_to flight_path(@flight)
        @flight = Flight.create(post_params)
        render json: @flight, status: 201
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
