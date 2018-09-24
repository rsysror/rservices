class AddCompnayNameToPortfolio < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :company_name, :string
    add_column :portfolios, :company_ph_no, :string
  end
end
