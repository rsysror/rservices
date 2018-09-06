class AddGeocoderToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column  :addresses, :address, :string
    add_column  :addresses, :latitude, :float
    add_column  :addresses, :longitude, :float
  end
end
