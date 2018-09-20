class ServiceRequest < ApplicationRecord
    
  #active record Associations
  has_one :feedback
  belongs_to :user
  belongs_to :address
  belongs_to :service
  belongs_to :status
  belongs_to :portfolio
  belongs_to :time_slot
  belongs_to :assigned_to, class_name: 'User',foreign_key: "assignee_id", optional: true



  validates :user_id, :address_id, :service_id, :time_slot_id, presence: true

  #scope method
  scope :ordered, -> {order('updated_at DESC')}
  scope :accepted_request, -> { where(status_id: 1) }
  scope :available_employees, -> { where('status_id IN (?)', [4]).map{|m| m.assigned_to}.compact
 }


  #delegates to access address columns from service_request object
  delegate :flat_number,:street_name,:pin_code,:city, :to => :address

  #callback
  before_validation :set_request_status, :generate_service_request_number
  
  def set_request_status 
    self.status_id = Status.pending.first.id if status_id.blank?
  end

  def generate_service_request_number
    self.service_request_number = "SR-#{SecureRandom.hex(10)}" unless  self.service_request_number.present?
  end

  # def google_address?
  #   unless address.google_address.blank?
  #     true
  #   else
  #     false
  #   end
  # end

  # def google_address
  #   if google_address?
  #     address.google_address
  #   end
  # end

  def user_phone
    user.phone.present? ? user.phone : "-"
  end

  def user_address
    address.complete_address
  end

  def user_name
    user.full_name
  end

  def self.get_all_service_requests page
    where.not(portfolio_id: [nil, ""]).order("id DESC").paginate(:page => page, :per_page => 5)
  end 

  def assignee_details
    assigned_to.present? ? "#{assigned_to.email + assigned_to.phone}" : "No Assignee Yet"
  end

end

