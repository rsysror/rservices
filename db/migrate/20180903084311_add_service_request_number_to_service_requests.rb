class AddServiceRequestNumberToServiceRequests < ActiveRecord::Migration[5.2]
  def change
  	add_column :service_requests, :service_request_number, :string
  end
end
