class Portfolio < ApplicationRecord
  mount_uploaders :images, ImageUploader
  mount_uploaders :documents, ImageUploader

  belongs_to :user
  belongs_to :city, optional: true
  belongs_to :service, optional: true
  has_many :service_requests

  # validates :city, presence: true, on: :update
  # validates :service, presence: true, on: :update
  # validates :gender, :about, :experience, :education, presence: true
  
  # attr_accessor :avatar_file_name

  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/, :if => Proc.new { |profile| profile.avatar.file? }
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def portfolio_with_user_name_and_about
    "#{user.first_name}" + ",#{about}" + ",#{user.phone}" + ",#{user.email}"
  end

  def user_email 
    user.email
  end

  def available_time_slots
    service_requests.present? ? TimeSlot.ordered - service_requests.map{|m| m.time_slot}.compact : TimeSlot.ordered
  end

  def available_time_slots_for_update service_request
    included_service_request = service_requests.reject{|r| r.id == service_request.id}
    included_service_request.present? ? TimeSlot.ordered - included_service_request.map{|m| m.time_slot}.compact : TimeSlot.ordered
  end
  
end