class SubService < ApplicationRecord
  belongs_to :service, dependent: :destroy
end
