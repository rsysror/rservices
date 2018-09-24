class Address < ApplicationRecord

  has_many :service_requests, dependent: :destroy
  belongs_to :user

  belongs_to :city, optional: true

  # Validate form on server
  validates :flat_number, presence: {message: 'Flat no is required!'}, if: :latitude_exists?
  validates :flat_number, length: { in: 1..50, message: 'Flat no must have 1 to 50 characters!' }, if: :latitude_exists?
  validates :street_name, length: { in: 5..150, message: 'Street name must have 5 to 150 characters!' }, if: :latitude_exists?
  validates :pin_code, presence: {message: 'Pin code is required!'}, if: :latitude_exists?
  validates :pin_code, length: { in: 5..10, message: 'Pin code must have 5 to 10 characters!' }, if: :latitude_exists?
  validates :landmark, length: { in: 5..150, message: 'Landmark must have 5 to 150 characters!' }, if: :latitude_exists?
  validates :city_id, presence: {message: 'At leaset 1 city should be selected!'}, if: :latitude_exists?


  geocoded_by :address # address is an attribute of MyModel
  after_validation :geocode
  
  before_validation :reverse_geocode, on: :create


  reverse_geocoded_by :latitude, :longitude do |address,results|
    if geo = results.first
      state = State.where(:name => geo.state).first
      if state && geo.city 
        city = City.where(:name => geo.city).first 
        unless city 
          city = City.create(:name => geo.city, :state_id => state.id)
        end
        geo_address = geo.data["address"]
        address.flat_number = geo_address["building"] ||  geo_address["house_number"] ||  geo_address["residential"] || geo_address["hotel"] 
        address.street_name = geo_address["locality"] ||  geo_address["university"] || geo_address["college"] || geo_address["village"]
        address.landmark = geo_address["road"] || geo_address["suburb"] 
        address.city  = city
        address.pin_code = geo_address["postcode"]
      else
        address.errors.add(:base, "We are not providing service on this state & city")
      end
    end
  end

  def has_service_requests?
    service_requests.present?
  end

  def complete_address
    if google_address.present?
      google_address
    else
      "#{flat_number} #{street_name} #{landmark}, #{city.try(:name)}, #{pin_code}"
    end
  end

  def latitude_exists?
    latitude.nil?
  end

end

