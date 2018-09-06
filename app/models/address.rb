class Address < ApplicationRecord
	has_many :service_request
	belongs_to :user
	belongs_to :city , optional: true

  geocoded_by :address # address is an attribute of MyModel
  after_validation :geocode, :if => :address_changed?
  
  after_validation :reverse_geocode


  reverse_geocoded_by :latitude, :longitude do |address,results|

    if geo_address = results.first
      state = State.where(:name => geo_address.state).first
      if state
        city = City.where(:name => geo_address.city).first 
        unless city
          city = City.create(:name => geo_address.city, :state_id => state.id)
        end
        address.city  = city
        address.pin_code = geo_address.postal_code
      # else
      #   address.errors.add(:city)
      end

    end
  end

end
