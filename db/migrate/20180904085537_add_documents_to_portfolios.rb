class AddDocumentsToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :documents, :json
  end
end
