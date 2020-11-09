FactoryBot.define do
  factory :user do
    nickname              {"パン"}
    email                 {"kkk@gmail.com"}
    password              {"taiki1192"}
    password_confirmation {password}
    birthday              {"1987-12-12"}
    lastname              {"山田"}
    firstname             {"太郎"}
    katakana_firstname    {"ヤマダ"}
    katakana_lastname     {"タロウ"}
  end
end



# validates :nickname, presence: true
#   validates :birthday, presence: true
#   validates :lastname, presence: true
#   validates :firstname, presence: true
#   validates :katakana_lastname, presence: true
#   validates :katakana_firstname, presence: true 