class Portfolio < ApplicationRecord
  mount_uploaders :images, ImageUploader
  mount_uploaders :documents, ImageUploader

  belongs_to :user
  has_many :portfolio_services
  has_many :services, through: :portfolio_services
  has_many :cities, through: :portfolio_services
  has_many :service_requests
  has_many :feedbacks

  # validates :service, presence: true, on: :update
  validates :about, :experience, :company_ph_no, :address, :company_name, presence: true, on: :update
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def portfolio_with_user_name_and_about
    "#{user.try(:email)}"
  end

  def user_email 
    user.email
  end

  def active?
    status == true
  end

  def portfolio_status
    status ? "Active" : "In Active"
  end

  def reverse_portfolio_status
    status ? "Deactivate" : "Activate" 
  end

  def available_time_slots date
    time_slots = service_requests.present? ? TimeSlot.ordered - service_requests.where(service_date: date).map{|m| m.time_slot}.compact : TimeSlot.ordered 
    (date.to_date.strftime("%d/%m/%Y") == Time.now.strftime("%d/%m/%Y")) ? select_time_slots(time_slots) : time_slots
  end

  def available_time_slots_for_update service_request
    time_slots = service_requests.present? ? TimeSlot.ordered - service_requests.where(service_date: service_request.service_date).map{|m| m.time_slot}.compact : TimeSlot.ordered 
    all_slots = (service_request.service_date.strftime("%d/%m/%Y") == Time.now.strftime("%d/%m/%Y")) ? select_time_slots(time_slots) : time_slots
    return all_slots << service_request.time_slot
  end

  def select_time_slots time_slots
    current_time  = Time.now 
    excluded_time_slot =  current_time.strftime("%H") + ":00"
    time_slots.select{|time| excluded_time_slot < time.start_time}
  end

  def get_all_services page, per_page=5
    portfolio_services.order(:id).paginate(:page => page, :per_page => per_page)
  end

  def fetch_service_price service_id
    portfolio_services.where(service_id: service_id).last.try(:price).to_s
  end

  def remove_existing_service_city(service_id)
    portfolio_services.where(service_id: service_id).map{|ps| ps.city}
  end
  
end