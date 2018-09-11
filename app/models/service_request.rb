class ServiceRequest < ApplicationRecord
	
	#active record Associations
  has_one :feedback
	belongs_to :user
	belongs_to :address
	belongs_to :service
	belongs_to :status
	belongs_to :portfolio
	belongs_to :time_slot

  #scope method
	scope :ordered, -> {order('updated_at DESC')}

	#delegates to access address columns from service_request object
	delegate :flat_number,:street_name,:pin_code,:city, :to => :address

	#callback
	before_validation :set_request_status, :generate_service_request_number

  
	def set_request_status 
		self.status_id = Status.pending.first.id if status_id.blank?
	end

	def generate_service_request_number
		self.service_request_number = "SR-#{SecureRandom.hex(10)}" unless  self.service_request_number.present?
	end

	def full_address
		address.flat_number
	end

  def google_address?
    unless address.google_address.blank?
      true
    else
      false
    end
  end

  def google_address
    if google_address?
      address.google_address
    end
  end

end

