class Flight < ApplicationRecord
 
    # relationshsip
    has_many :flight_rides
    has_many :users, through: :flight_rides


    #  validations
    validates :inspection, :presence => true
    validates :fuel_cost, :presence => true
    validates :destination, :presence => true
    validates :flight_departure, :presence => true
    validates :flight_sit, :presence => true


    scope :pass_inspection, -> { where(inspection: true) }
end
