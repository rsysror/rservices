class AddTimeSlotIdToServiceRequests < ActiveRecord::Migration[5.2]
  def change
  	add_column :service_requests, :time_slot_id, :integer
  	add_column :service_requests, :service_date, :datetime
  end
end
