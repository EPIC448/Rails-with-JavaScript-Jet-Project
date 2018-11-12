  # make sure to include in form of the creation of flight if inspection is true check box... So the user can check if the person pass inpections or not.


  Next Step:  [When turn red or hash tag means comeplete]

   # then we go an build the => Create the authentication flow for current_user

    => Build out all the controllers with the conresponding views.  [user new sign up page, user conctroller actions]
    
    Include in they actions as well.
    => Build out the login, signout, authentications with the proper routes & actions. 
     
    => add the authentications in the  controllers
 
    Nested routs. of this...

     Flight
           Nest  Flight_ride..... ( Flight will have list of flight_ride(a.k.a people that will be taking/ using that flight.))


            skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

