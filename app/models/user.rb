class User < ApplicationRecord
	has_secure_password
	has_many :flight_rides
	has_many :flight,through: :flight_rides


	validates :name, presence: true
	validates :password, presence: true

end
