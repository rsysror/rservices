class State < ApplicationRecord
	scope :details, proc{ |country_id| self.where(:country_id => country_id).order(name: :asc) if country_id.present? }
end
