class CreatePortfolioServices < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolio_services do |t|
      t.integer :portfolio_id
      t.integer :service_id
      t.float :price
      t.integer :city_id

      t.timestamps
    end
  end
end
