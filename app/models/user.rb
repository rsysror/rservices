class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  attr_accessor :role

  validates :first_name, :email, :phone, presence: true
  validates :password, :presence => true, :confirmation => true, :length => {:within => 6..128}

  has_one :portfolio
  has_many :service_requests
  has_many :addresses
  has_many :feedbacks


  def admin?
    has_role? :admin
  end

  def partner?
    has_role? :partner
  end

  def user?
    has_role? :user
  end

  def get_all_address_from_service_city service_request
    self.addresses.where(city_id: service_request.address.city_id)
  end

  def full_name
    [first_name, last_name].select(&:present?).join(' ').titleize
  end

  def self.get_users role, page
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
