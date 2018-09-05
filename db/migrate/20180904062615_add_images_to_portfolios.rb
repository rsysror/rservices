class AddImagesToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :images, :json
  end
end
