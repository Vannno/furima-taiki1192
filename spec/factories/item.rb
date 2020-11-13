FactoryBot.define do
  factory :item do
    name                  {"傘"}
    info                  {"この傘は便利です"}
    category_id           {"2"}
    status_id             {"2"}
    burden_id             {"2"}
    area_id               {"2"}
    ship_id               {"2"}
    value                 {"600"}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/output-image1.png'), filename: 'output-image1.png')
    end
  end
end


