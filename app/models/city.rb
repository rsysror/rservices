class City < ApplicationRecord
  #associations
	# has_and_belongs_to_many :services
  has_many :addresses
  has_many :portfolio
  has_many :services, through: :portfolio_services
  has_many :portfolio_services
	
  #scope methods
	scope :details, proc{ |state_id| self.where(:state_id => state_id).order(name: :desc) if state_id.present? }
  
  scope :ordered, -> {order('name')}



	def get_curent_user_address user
		addresses.where(user_id: user.id)
	end
		
end
