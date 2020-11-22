class Record < ApplicationRecord
  has_one :address
  belongs_to :item
end
