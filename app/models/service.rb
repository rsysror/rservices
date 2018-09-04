class Service < ApplicationRecord
  has_and_belongs_to_many :cities
  has_many :sub_services, class_name: "Service", foreign_key: "parent_id", dependent: :destroy
  belongs_to :service, class_name: "Service",  foreign_key: "parent_id",optional: true
  has_many   :service_requests
  has_one    :portfolio
  has_many   :time_slots, through: :service_requests, source: :service


  #scope methods
	scope :get_services, -> { where("parent_id IS NULL") }
	
end
