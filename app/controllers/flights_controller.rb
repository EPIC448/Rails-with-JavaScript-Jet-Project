class FlightsController < ApplicationController
  def index
binding.pry
    # @user = User.new
    @flights = Flight.new
    @flights = Flight.all
  end

  def show
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
      #  redirect_to flight(@flight)
       render 'flights/show'
    else
      render 'flights/new'
    end

    def edit
      @flight = Flight.find(params[:id])
    end
   

   end

  def update 
    @flight = Flight.find(params[:id])
    @flight.update(flight_params)
    redirect_to flight_path(@flight)
 end

 private
   # will come handy if want to give people the chance to create there own flight
   
   def flight_params
    params.require(:flight).permit(:inspection, :fuel_cost, :destination, :flight_departure, :flight_sit)
  end 

end
