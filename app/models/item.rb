class Item < ApplicationRecord
  
  validates :name, presence: true
  validates :item_info, presence: true
  validates :category_id, presence: true
  validates :item_status_id, presence: true
  validates :burden_charges_id, presence: true
  validates :delivery_source_id, presence: true
  validates :days_ship_id, presence: true
  validates :value, presence: true
  validates :position, presence: true

  belongs_to :user
  has_one :record
end
