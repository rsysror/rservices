class TimeSlot < ApplicationRecord
	has_many :service_requests
	has_many :services, through: :service_requests


	#scope methods
	scope :ordered, -> {order('created_at')}


	def start_time_with_end_time
		start_time + '-' + end_time
	end

end
