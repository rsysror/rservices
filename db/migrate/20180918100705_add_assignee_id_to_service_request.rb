class AddAssigneeIdToServiceRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :service_requests, :assignee_id, :integer
  end
end
