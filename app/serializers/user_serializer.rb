class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :flight, Serializer: FlightUserSerializer 
end
