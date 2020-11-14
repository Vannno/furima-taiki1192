class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :ship_id
    validates :name
    validates :info
    validates :image
  end 

  with_options presence: true, format: { with: /\A[0-9]+\z/} do
    validates :value, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :area_id, :burden_id, :category_id, :ship_id, :status_id,  numericality: { other_than: 0 }
  end

  belongs_to :user
  has_one :record
  has_one_attached :image

end
