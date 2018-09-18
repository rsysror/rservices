class RemoveServiceIdFromPortfolio < ActiveRecord::Migration[5.2]
  def change
    remove_column :portfolios, :service_id
  end
end
