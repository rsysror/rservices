class AddPortfolioIdToServiceRequest < ActiveRecord::Migration[5.2]
  def change
  	add_column :service_requests, :portfolio_id, :integer
  end
end
