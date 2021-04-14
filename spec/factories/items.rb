FactoryBot.define do
  factory :item do
    product                    {Faker::Food.sushi}
    category_id                {2}
    price                      {9999}
    condiction_id               {2}
    shipping_chager_id         {2}
    shipping_area_id           {2}
    shipping_day_id            {2}
    explanation                {Faker::Lorem.characters(number: 100)}
     association :user 
     after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
