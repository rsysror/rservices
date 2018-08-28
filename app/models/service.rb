class Service < ApplicationRecord
  has_and_belongs_to_many :cities

  has_many :sub_services, class_name: "Service", foreign_key: "parent_id", dependent: :destroy
 
  belongs_to :service, class_name: "Service", foreign_key: "parent_id"

end
