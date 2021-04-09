FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    encrypted_password    {password}
    last_name             {"山だ"}
    last_name_kana          {"ヤマダ"}
    first_name            {"太ろう"}
    first_name_kana       {"タロウ"}
    birthday             {"2000-01-01"}
    nickname              {Faker::Name.initials(number: 1)}
  end
end