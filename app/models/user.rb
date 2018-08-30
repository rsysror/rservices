class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :role

  has_one :portfolio
         
  def admin?
  	has_role? :admin
  end

  def partner?
    has_role? :partner
  end



end
