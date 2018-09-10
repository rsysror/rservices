class AddPriceToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :price, :decimal, precision: 15, scale: 10
  end
end
