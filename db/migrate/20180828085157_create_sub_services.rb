class CreateSubServices < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_services do |t|
      t.string :name
      t.integer :service_id

      t.timestamps
    end
  end
end
