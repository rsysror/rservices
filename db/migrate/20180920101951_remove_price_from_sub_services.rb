class RemovePriceFromSubServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :price, :decimal
  end
end
