class FlightRide < ApplicationRecord
    belongs_to :user
    belongs_to :flight

    # add a method in here(take_flight)
    # check for if user has enough cash for this flight ride
        # check for if user has time for this flight ride
    # check for flight passes inspection (true or False)

end
