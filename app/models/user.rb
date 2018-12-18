class User < ApplicationRecord
	has_secure_password
	has_many :flight_rides
	has_many :flight,through: :flight_rides


	validates :name, presence: true
	validates :name, unique:  true

	validates :name, format: {without: /[0-9]/, message: "does not allow numbers" }
	validates :password, presence: true

	def self.find_or_create_by_omniauth(auth_hash)
        self.where(:name => auth_hash[:info][:name]).first_or_create do |user|
			user.password = SecureRandom.hex
        end
    end

end
