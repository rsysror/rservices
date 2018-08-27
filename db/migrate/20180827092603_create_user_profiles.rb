class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.integer :city_id
      t.integer :sub_service_id
      t.string :experience
      t.string :qualification
      t.float :hourly_rate

      t.timestamps
    end
  end
end
