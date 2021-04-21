FactoryBot.define do
  factory :purchase_address do
    postal_code             { '123-4567' }
    phone_number            { '08012345678' }
    shipping_area_id        { 2 }
    municipality            { '横浜市緑区' }
    address                 { '青山1-1-1' }
    building_name           { '柳ビル103' }
    token                   {'tok_abcdefghijk00000000000000000'}
  end
end
