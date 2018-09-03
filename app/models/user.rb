class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  attr_accessor :role

  validates :first_name, :email, presence: true
  validates :password, :presence => true, :confirmation => true, :length => {:within => 6..128}

  has_one :portfolio
  has_many :service_requests
  has_many :addresses

  def admin?
    has_role? :admin
  end

  def partner?
    has_role? :partner
  end

end
