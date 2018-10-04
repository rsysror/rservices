class ServiceRequest < ApplicationRecord
  # frozen_string_literal: true
  # active record Associations
  has_one :feedback
  belongs_to :user
  belongs_to :address
  belongs_to :service
  belongs_to :status
  belongs_to :portfolio
  belongs_to :time_slot
  belongs_to :assigned_to, class_name: 'User',
                           foreign_key: 'assignee_id', optional: true

  validates :user_id, :address_id, :service_id, :time_slot_id, presence: true

  # scope method
  scope :ordered, -> { order('updated_at DESC') }
  scope :accepted_request, -> { where(status_id: Status.accepted.first.id) }
  scope :available_employees, -> { where('status_id IN (?)', [Status.pending.first.id]).map(&:assigned_to).compact }

  # delegates to access address columns from service_request object
  delegate :flat_number, :street_name, :pin_code, :city, to: :address

  # callback
  before_validation :set_request_status, :generate_service_request_number
  
  def set_request_status
    self.status_id = Status.pending.first.id if status_id.blank?
  end

  def generate_service_request_number
    self.service_request_number = "SR-#{SecureRandom.hex(10)}" unless service_request_number.present?
  end

  def self.comments_list
    ['Task completed successfully.', 'Task is still in pending.',
     'No one available at given address & timing.',
     'Work depends on others', 'Other Reason']
  end

  def user_phone
    user.phone.present? ? user.phone : '-'
  end

  def user_address
    address.complete_address
  end

  def user_name
    user.full_name
  end

  def service_name
    service.try(:name).titleize
  end

  def service_status
    status.try(:name)
  end

  def service_time
    try(:time_slot).try(:start_time_with_end_time)
  end

  def self.get_all_service_requests(page)
    where.not(portfolio_id: [nil, '']).order('id DESC').paginate(page: page, per_page: 5)
  end

  def assignee_details
    assigned_to.present? ? assigned_to.try(:email).to_s : 'No Assignee Yet'
  end
end
