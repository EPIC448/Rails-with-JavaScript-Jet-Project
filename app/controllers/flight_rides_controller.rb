class FlightRidesController < ApplicationController

        skip_before_action :verify_authenticity_token
      
        def index
          @flight_ride = FlightRide.new
          @flight_rides= FlightRide.all
        end
      
        def new
         @flight_ride = FlightRide.create(:user_id => params[:user_id], :flight_id => params[:flight_id])
         # we want to add the take a ride logic here.
         flash[:notice] = @flight_ride.take_flight

         redirect_to user_path(@flight_ride.user) # this should feed into user id with an updated ticekts and stuff.
        end
      
         def create
            @user = User.find(params[:user_id]) # finding the parent
            @flight_ride = @user.flight_rides.build(flight_ride_params)
           if @flight_ride.save
             redirect_to user_path(@user)
           else
           render "users/show"
           end
         end
      
      
         def update
            @flight_ride = FlightRide.find(params[:id])
            @flight_ride.update(flight_ride_params)
    
            redirect_to user_path(@flight_ride.user)
         end
        
         def show
            @flight_ride = Flight_ride.find(params[:id])
            render 'flight_rides/show'
         end

         private

      def flight_ride_params
       params.permit(:user_id, :flight_id, :flight_class)
      end 
      
      
end
