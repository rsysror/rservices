class Portfolio < ApplicationRecord
  mount_uploaders :images, ImageUploader
  mount_uploaders :documents, ImageUploader

  belongs_to :user
  belongs_to :city, optional: true
  belongs_to :service, optional: true
  has_many :service_requests
  has_many :feedbacks

  validates :city, presence: true, on: :update
  validates :service, presence: true, on: :update
  validates :gender, :about, :experience, :education, presence: true, on: :update
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def portfolio_with_user_name_and_about
    "#{user.email}"
  end

  def user_email 
    user.email
  end

  def available_time_slots
    service_requests.present? ? TimeSlot.ordered - service_requests.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day).map{|m| m.time_slot}.compact : TimeSlot.ordered
  end

  def available_time_slots_for_update service_request
    included_service_request = service_requests.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day).reject{|r| r.id == service_request.id}
    included_service_request.present? ? TimeSlot.ordered - included_service_request.map{|m| m.time_slot}.compact : TimeSlot.ordered
  end
  
end