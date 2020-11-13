class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :burden_id, presence: true
  validates :area_id, presence: true
  validates :ship_id, presence: true
  validates :area_id, :burden_id, :category_id, :ship_id, :status_id,  numericality: { other_than: 1 }
  validates :image, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/} do
    validates :value, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end


  belongs_to :user
  has_one :record
  has_one_attached :image

  

end
