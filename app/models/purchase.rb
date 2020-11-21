class Purchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :place, :building_name, :phone_number, :item_id, :user_id ,:token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :place
    validates :phone_number, length: { maximum: 11}
    validates :phone_number, numericality: true
    validates :item_id       
    validates :user_id
    validates :token
  end


  def save
    # 各テーブルにデータを保存する処理を書く
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, place: place, building_name: building_name, phone_number: phone_number, record_id: record.id )
  end

end