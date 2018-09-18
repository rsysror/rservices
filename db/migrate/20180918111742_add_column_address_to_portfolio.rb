class AddColumnAddressToPortfolio < ActiveRecord::Migration[5.2]
  def change
    remove_column :portfolios, :city_id, :integer
    add_column :portfolios, :address, :string
  end
end
