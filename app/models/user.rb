class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
         
 
   validates :nickname, presence: true
   validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
   validates :lastname, presence: true
   validates :firstname, presence: true
   validates :katakana_lastname, presence: true
   validates :katakana_firstname, presence: true  
  end 
 
  

  has_many :records
  has_many :items             
end


# with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do

 