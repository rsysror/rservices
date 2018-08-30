class City < ApplicationRecord
  #associations
	has_and_belongs_to_many :services
  has_many :addresses
	

  #scope methods
	scope :ordered, -> { order(:name) }
	scope :details, ->(state_id) { where(:state_id => state_id)}
	
end
