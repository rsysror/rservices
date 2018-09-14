class Status < ApplicationRecord

	ACTION =["accepted", "rejected", "pending", "inprogress", "completed", "incompleted" ] 
	has_many :service_requests

  scope :accepted, -> { where(name: 'Accepted') }
  scope :rejected, -> { where(name: 'Rejected') }
  scope :pending, -> { where(name: 'Pending') }
  scope :inprogress, -> { where(name: 'Inprogress') }
  scope :completed, -> { where(name: 'Completed') }
  scope :incompleted, -> { where(name: 'InCompleted') }

  
  def self.get_status_value status
  	where(name: status).last
  end	

end
