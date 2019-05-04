class FlightSerializer < ActiveModel::Serializer
  attributes :id, :inspection, :fuel_cost, :destination

  has_many :users
end
