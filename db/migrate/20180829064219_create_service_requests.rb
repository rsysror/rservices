class CreateServiceRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :service_requests do |t|
      t.integer  :status_id 	
      t.integer  :user_id
      t.integer  :address_id
      t.integer  :service_id 
      t.timestamps
    end
  end
end
