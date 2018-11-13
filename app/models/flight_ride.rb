class FlightRide < ApplicationRecord
    belongs_to :user
    belongs_to :flight

    # add a method in here(take_flight)
    # check for if user has enough cash for this flight ride
        # check for if user has time for this flight ride
    # check for flight passes inspection (true or False)


    def take_flight

        #accounts for the user not having enough ticket & user not tall enough
         # most alter all of the below

                    if  self.user.user_cash > self.flight.fuel_cost && self.flight.inspection == "true" && self.user.owner_departure < self.flight.flight_departure  #= need to be true
                
                       new_cash = self.user.user_cash - self.flight.fuel_cost
                        self.user.update(:user_cash => new_cash)
            
                        self.user.save
                        "Thanks for riding this flight #{self.user.name}!"

                    elsif self.user.user_cash < self.flight.fuel_cost && self.user.owner_departure < self.flight.flight_departure  #= need to be true
                        "Sorry. You dont have enough cash for this flight #{self.user.name}."
                    elsif self.user.user_cash > self.flight.fuel_cost && self.user.owner_departure > self.flight.flight_departure
                        # user height is greater then attraction & user ticket is less than attraction tickets
                        "Sorry. You missed your appionted flight for your trip #{self.user.name}."
                    else
                        "Sorry for the inconvenience, This flight did not pass inspection #{self.user.name}. You are not tall enough to ride the #{self.attraction.name}."
                    end
        
            

    end
      

end
