class CitiesServices < ActiveRecord::Migration[5.2]
  def change
    create_table :cities_services, id: false do |t|
      t.belongs_to :city, index: true
      t.belongs_to :service, index: true
    end
  end
end
