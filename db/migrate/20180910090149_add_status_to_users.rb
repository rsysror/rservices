class AddStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :status, :boolean, :default => false
  end
end
