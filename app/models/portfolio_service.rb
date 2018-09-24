class PortfolioService < ApplicationRecord
  belongs_to :service
  belongs_to :portfolio, optional: true
  belongs_to :city

  scope :city_services, -> (service_id, city_id)  { where(service_id: service_id, city_id: city_id) }
end
