class FlightRide < ApplicationRecord
    belongs_to :user
    belongs_to :flight


    def take_flight


                if  self.user.user_cash > self.flight.fuel_cost && self.flight.inspection == "true" 
                        
                
                       new_cash = self.user.user_cash - self.flight.fuel_cost
                        self.user.update(:user_cash => new_cash)
            
                        self.user.save
                        "Thanks for riding this flight #{self.user.name}!"

                elsif self.user.user_cash > self.flight.fuel_cost && self.flight.inspection == "false" 
                    "Sorry for the inconvenience, This flight did not pass inspection #{self.user.name}"
                else
                        "Sorry. You dont have enough money flight for your trip #{self.user.name}."
                    
                 end

    end
      

end
