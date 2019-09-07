class FlightSerializer < ActiveModel::Serializer
  # we us serializer to pick and choose attributes we want in the content  .json
  attributes :id, :inspection, :fuel_cost, :destination

  has_many :users
  

end
