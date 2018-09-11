class AddGoogleAddressToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :google_address, :string
  end
end
