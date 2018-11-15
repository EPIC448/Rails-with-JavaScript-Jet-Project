class FlightRideController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
   @flight_ride = FlightRide.create(:user_id => params[:user_id], :flight_id => params[:flight_id])
   # we want to add the take a ride logic here.
   flash[:notice] = @flight_ride.take_flight
   redirect_to user_path(@flight_ride.user) # this should feed into user id with an updated ticekts and stuff.
  end

   def create


   end

   def edit

   end

   def update
   end
  
   def show
   end

end
