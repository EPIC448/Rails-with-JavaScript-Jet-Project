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
    
    # validates :flight_class, inclusion: { in: %w(economy first_class),
    # message: "%{value} is not a valid size" }, allow_nil: true
    #  end
    
    # validates :flight_class, :default => "Economy"

    scope :pass_inspection, -> { where(inspection: true) }
end
