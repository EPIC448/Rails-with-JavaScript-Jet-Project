class FlightRidesController < ApplicationController

        skip_before_action :verify_authenticity_token
      
        def index
          @flight_ride = FlightRide.new
          @flight_rides= FlightRide.all
        end
      
        def new
         # @flight_ride = FlightRide.create(:user_id => params[:user_id], :flight_id => params[:flight_id])
         @flight_ride = FlightRide.create(flight_ride_params)

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
         params.require(:flight_ride).permit(:user_id, :flight_id, :flight_class)
      end 


  
# [https://learn.co/tracks/full-stack-web-development-v6/rails/associations-and-rails/has-many-through-in-forms]
      # You definitely want to keep the strong params. 
      # The issue is that you need your params from your 
      # form to be passed through like this: `{flight_ride" => {"user_id"=>"14", "flight_id"=>"3" }}` 
      #  If you use form_for with an empty flight ride object, 
      # the params will typically generate correctly on their own
      
      
end
