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



