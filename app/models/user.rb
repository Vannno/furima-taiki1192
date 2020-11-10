class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  with_options presence: true do
   validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end
   with_options presence: true do
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
  end
  with_options presence: true do
   validates :katakana_lastname, format: { with: /\A[ァ-ヶー－]+\z/}
   validates :katakana_firstname, format: { with: /\A[ァ-ヶー－]+\z/}
  end
 
  with_options presence: true do
    validates :birthday 
    validates :nickname 
  end

  has_many :records
  has_many :items             
end



 