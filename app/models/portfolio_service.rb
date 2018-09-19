class PortfolioService < ApplicationRecord
  belongs_to :service
  belongs_to :portfolio,  optional: true
  belongs_to :city
end
