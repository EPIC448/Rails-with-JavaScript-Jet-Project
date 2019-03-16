class FlightSerializer < ActiveModel::Serializer
  attributes :id, :inspection, :fuel_cost, :destination

  has_many :flight_rides, serializer: FlightSerializer
  has_many :users,        serializer: FlightSerializer
end
