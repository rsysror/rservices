class CreateTimeSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :time_slots do |t|
      t.string  :start_time
      t.string  :end_time
      t.timestamps
    end
  end
end
