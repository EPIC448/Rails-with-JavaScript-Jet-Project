class User < ApplicationRecord
	has_secure_password
	has_many :flight_rides
	has_many :flight,through: :flight_rides


	validates :name, presence: true
	validates :name, format: {without: /[0-9]/, message: "does not allow numbers" }
	validates :password, presence: true

 # omniauth goes here.
	# def self.find_or_create_by_omniauth(auth_hash)
    #     self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
    #     user.password = SecureRandom.hex
    #     end
    # end

end
