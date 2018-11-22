  # make sure to include in form of the creation of flight if inspection is true check box... So the user can check if the person pass inpections or not.


  Next Step:  [When turn red or hash tag means comeplete]

   # then we go an build the => Create the authentication flow for current_user

   # <!-- =#> #Build out all the controllers with the conresponding views.  [user new sign up page, user conctroller actions]
    
    <!-- ## Include in they actions as well.
    # Build out the login, signout, authentications with the proper routes & # actions. 
      -->
    => add the authentications in the  controllers
  -->

   √  NEXT-STEP
    √ Nested routs. of this...

     √ Flight
           Nest  Flight_ride..... ( Flight will have list of flight_ride(a.k.a people that will be taking/ using that flight.))


            skip_before_action :verify_authenticity_token

  √def new
    @user = User.new
  end

  √=> today list-------

 √=>  Flight_rides==> 

  √   - 	Flight_Ride class – string (economy, first-class) Default     to Economy, [Add as check box for First class else,         default to coach]   
  √-And the Views that goes with flight_rides it and it controllers......

  √=> Need to You Implemnt Nested Resources..(code the flight_rides controller)
  
  √and Remove owner_departure ( and it logic in √flight_rides controller.)

  <!-- VVVThis is the next pieceVVV -->

  √=> Error messages... / validation error..

 √ => test associations in console
  => Read up on understanding of scope(It in your coursess)
  => navigation bar / links to other parts of project (options... Look up in google)

  √ => Login in page..
   √=> a way to build costume validations to make flight_ride default "economy" and with possible check book for First class. Or  Type in first class, or Drop down menu.
   

   ----------------------
  √ Omniauth Break down.
    √ How to code Omniauth into your sessions/create √controller.
    √ I just had if/else statements in my create √function in the sessions controller. It should √not require a model and controller of its own, it √can all be done in the sessions controller. Hope √that helps


      Create the Routing (i.e- get '/auth/facebook/callback' => 'omni#create') 
        ^^^ omni controller_create.^^^^^

     √ -> Then it links into the Indexs of ALL THE FLIGHT

 Get Login to work properly..
 Finalize authenicate for FAcebook .

   ---------------
   
    => app/views/flights/ needs [
      #How do i add flight.ride attribute [flight.ride.class]
      # so it deplay on the NewLy created flight on app/view/flights/show]
       # you Want this to route back to the Flight Show page, With the updated version after the already went on a Flight_ride....

---------------------

<!-- >>>>> -->

  

