class Service < ApplicationRecord
  # frozen_string_literal: true
  mount_uploader :photo, ImageUploader

  # has_and_belongs_to_many :cities
  has_many :sub_services, class_name: 'Service',
                          foreign_key: 'parent_id', dependent: :destroy
  belongs_to :service, class_name: 'Service',
                       foreign_key: 'parent_id', optional: true
  has_many   :service_requests
  has_many   :portfolios, through: :portfolio_services
  has_many   :time_slots, through: :service_requests, source: :service
  has_many   :portfolio_services
  has_many   :cities, through: :portfolio_services

  validates :name, presence: { message: 'Service name is required!' }
  validates :name, length: { in: 3..110, message: 'There must be 3 to 110 characters only!' }
  validates :city_ids, presence: { message: 'At leaset 1 city should be selected!' }, if: :parent_id_nil?
  # scope methods
  scope :get_services, -> { where('parent_id IS NULL') }
  scope :get_sub_services, -> { where('parent_id IS NOT NULL') }

  def parent_id_nil?
    parent_id.nil?
  end

  def self.get_all_services(page, per_page)
    where(parent_id: nil).order(:id).paginate(page: page, per_page: per_page || 5)
  end

  def self.get_all_sub_services(parent_id, page, per_page)
    where(parent_id: parent_id).paginate(page: page, per_page: per_page || 5)
  end

  def service_city
    cities.order('name ASC').uniq
  end
end
