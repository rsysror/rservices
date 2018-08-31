class Portfolio < ApplicationRecord
  belongs_to :user
  belongs_to :city, optional: true
  belongs_to :service, optional: true
  has_many :service_requests
  attr_accessor :avatar_file_name

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/, :if => Proc.new { |profile| profile.avatar.file? }


  def portfolio_with_user_name_and_about
  	"#{user.first_name}" + ",#{about}" + ",#{user.phone}" + ",#{user.email}"
  end
  
end