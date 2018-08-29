class State < ApplicationRecord
	scope :details, ->(country_id) { where(:country_id => country_id)}
end
