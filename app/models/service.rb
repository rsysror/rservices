class Service < ApplicationRecord
  has_and_belongs_to_many :cities
  has_many :sub_services

end
