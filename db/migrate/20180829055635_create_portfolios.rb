class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.integer :service_id
      t.integer :user_id
      t.integer :city_id
      t.string :gender
      t.string :about
      t.float :experience
      t.string :education
      t.attachment :avatar

      t.timestamps
    end
  end
end
