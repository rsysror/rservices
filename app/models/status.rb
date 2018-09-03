class Status < ApplicationRecord

	has_many :service_requests

  scope :accepted, -> { where(name: 'Accepted') }
  scope :rejected, -> { where(name: 'Rejected') }
  scope :pending, -> { where(name: 'Pending') }
  scope :inprogress, -> { where(name: 'Inprogress') }

end
