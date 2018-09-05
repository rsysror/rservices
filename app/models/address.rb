class Address < ApplicationRecord
	has_many :service_request
	belongs_to :user
	belongs_to :city , optional: true

  geocoded_by :address # address is an attribute of MyModel
  after_validation :geocode, :if => :address_changed?
  
  after_validation :reverse_geocode


  reverse_geocoded_by :latitude, :longitude do |address,results|

    if geo_address = results.first
      state_id = State.where(:name => geo_address.state).first.id 
      if state_id
        city = City.where(:name => geo_address.city).first 
        unless city
          city = City.create(:name => geo_address.city, :state_id => state_id)
        end
        address.city  = city
        address.pin_code = geo_address.postal_code
      end
    end
  end

end
