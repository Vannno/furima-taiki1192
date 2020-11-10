class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  with_options presence: true,format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}  do
   validates :password
  end

   validates :nickname, presence: true
   validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
   validates :lastname
   validates :firstname
  end
  with_options presence: true,format: { with: /\A[ァ-ヶー－]+\z/} do
   validates :katakana_lastname
   validates :katakana_firstname  
  end
 
  

  has_many :records
  has_many :items             
end



 