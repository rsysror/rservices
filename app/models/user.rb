class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :invitable
  attr_accessor :role

  # validates :first_name, :email, :phone, presence: true
  # validates :password, :presence => true, :confirmation => true, :length => {:within => 6..128}

  has_one :portfolio
  has_many :service_requests
  has_many :addresses
  has_many :feedbacks
  has_many :employees,class_name: "User", foreign_key: "invited_by_id"
  has_many :assigned_service_requests, class_name: "ServiceRequest", foreign_key: "assignee_id"

  def admin?
    has_role? :admin
  end

  def partner?
    has_role? :partner
  end

  def user?
    has_role? :user
  end

  def employee?
    has_role? :employee
  end

  def get_all_address_from_service_city service_request
    addresses.where(city_id: service_request.address.city_id)
  end

  def full_name
    [first_name, last_name].select(&:present?).join(' ').titleize
  end

  def phone_no
    phone.present? ? phone : "-"
  end

  def self.get_users role, page=1
    includes(:addresses).with_role(role).paginate(:page => page, :per_page => 5)
  end

  def self.get_user_details id
    includes(:addresses).find(id)
  end  

  def get_user_service_requests page
    service_requests.includes(:service,:address,:status, :portfolio, :time_slot).ordered.paginate(:page => page, :per_page => 5)
  end

  def get_partner_service_requests page
    portfolio.service_requests.includes(:service,:address,:status, :portfolio, :time_slot).ordered.paginate(:page => page, :per_page => 5)
  end

  def portfolio_status
    portfolio.portfolio_status
  end
  
end
