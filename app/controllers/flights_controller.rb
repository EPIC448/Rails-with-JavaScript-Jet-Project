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
  end

    def edit 
      #need a way to access the Users total infomation as well as the flight information.
      # All included in the flight_ride table.
      binding.pry

      --------------
      # [47] pry(#<FlightsController>)> Flight.first
      # => #<Flight:0x007fda8e6af9f8
      #  id: 1,
      #  inspection: true,
      #  fuel_cost: 0,
      #  destination: "xzbv",
      #  flight_departure: 0,
      #  flight_sit: 0,
      #  created_at: Wed, 14 Nov 2018 14:50:11 UTC +00:00,
      #  updated_at: Wed, 14 Nov 2018 14:50:11 UTC +00:00>
      # [48] pry(#<FlightsController>)> Flight.first.flight_rides
      # => [#<FlightRide:0x007fda8869f450
      #   id: 1,
      #   user_id: 1,
      #   flight_id: 1,
      #   flight_class: nil,
      #   created_at: Wed, 14 Nov 2018 14:50:13 UTC +00:00,
      #   updated_at: Wed, 14 Nov 2018 14:50:13 UTC +00:00>,
      #  #<FlightRide:0x007fda8fa24088
      #   id: 2,
      #   user_id: 2,
      #   flight_id: 1,
      #   flight_class: nil,
      # [49] pry(#<FlightsController>)> Flight.flight_rides
      # NoMethodError: undefined met
      ---------------
      @flight = Flight.find(params[:id])
      Flight.users

      if  @current_user =  session[:user_id]
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

 private
   # will come handy if want to give people the chance to create there own flight
   
   def flight_params
    params.require(:flight).permit(:inspection, :fuel_cost, :destination, :flight_departure, :flight_sit, :user_id)
  end 

end
