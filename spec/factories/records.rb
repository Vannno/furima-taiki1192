FactoryBot.define do
  factory :purchase do
    token                {"yourOAuthaccesstoken"}
    postal_code          {"476-0003"}
    prefecture_id        {1}
    city                 {"名古屋市"}
    place                {"269"}
    phone_number         {"09099998888"}
    building_name        {"深沢ビル"}
    user_id              {2}
    item_id              {3}
  end
end





