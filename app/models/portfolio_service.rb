class PortfolioService < ApplicationRecord
  belongs_to :service
  belongs_to :portfolio
  belongs_to :city
end
