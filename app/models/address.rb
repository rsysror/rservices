class Address < ApplicationRecord
	has_many :service_requests, dependent: :destroy
	belongs_to :user
	belongs_to :city


  def has_service_requests?
  	self.service_requests.present?
  end
	
end
