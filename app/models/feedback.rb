class Feedback < ApplicationRecord
	belongs_to :portfolio
	belongs_to :user
	belongs_to :service_request	
end
