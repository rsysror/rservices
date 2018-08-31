class ServiceRequest < ApplicationRecord
	belongs_to :user
	belongs_to :address
	belongs_to :service
	belongs_to :status
	belongs_to :portfolio


	before_validation :set_request_status

  
	def set_request_status 
		self.status_id = 1 if status_id.blank?
	end

end
