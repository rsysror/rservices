class Address < ApplicationRecord
	has_many :service_request
	belongs_to :user
	belongs_to :city
end
