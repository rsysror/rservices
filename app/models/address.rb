class Address < ApplicationRecord
	has_many :service_requests, dependent: :destroy
	belongs_to :user
	belongs_to :city , optional: true
  # Validate form on server
  validates :flat_number, presence: {message: 'Flat no is required!'}
  validates :flat_number, length: { in: 1..50, message: 'Flat no must have 1 to 50 characters!' }
  validates :street_name, length: { in: 5..150, message: 'Street name must have 5 to 150 characters!' }
  validates :pin_code, presence: {message: 'Pin code is required!'}
  validates :pin_code, length: { in: 5..10, message: 'Pin code must have 5 to 10 characters!' }
  validates :landmark, length: { in: 5..150, message: 'Landmark must have 5 to 150 characters!' }
  validates :city_id, presence: {message: 'At leaset 1 city should be selected!'}


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

  def has_service_requests?
  	self.service_requests.present?
  end

end
