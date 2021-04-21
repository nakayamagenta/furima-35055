FactoryBot.define do
  factory :donation_address do
    postal_code { '123-4567' }
    #phone_number { 08012345678 }
    shipping_area_id { 1 }
    municipality { 横浜市緑区 }
    address { 青山1-1-1 }
    building_name{ 柳ビル103 }
  end
end
