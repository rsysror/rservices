class Address < ApplicationRecord
  has_many :service_request
  belongs_to :user
  belongs_to :city

  def complete_address
    [self.flat_number, self.street_name, self.landmark].select(&:present?).join(' ') + ', ' + self.city.try(:name).titleize + ', ' + self.pin_code
  end
end
