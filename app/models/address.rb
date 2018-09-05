class Address < ApplicationRecord
	has_many :service_request
	belongs_to :user
	belongs_to :city

	# Method to get the address of user
	def get_address
		self.flat_number+', '+self.street_name+', '+self.landmark+', Pin code: '+self.pin_code+', '+self.city.name
	end

		
end

