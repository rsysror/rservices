class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string   :flat_number
      t.string   :street_name
      t.string   :landmark
      t.string   :type
      t.string   :pin_code
      t.integer  :city_id
      t.integer  :user_id
      t.timestamps
    end
  end
end
