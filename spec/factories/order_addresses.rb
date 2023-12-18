FactoryBot.define do
  factory :order_address do
    item_id             { Faker::Number.non_zero_digit }
    user_id             { Faker::Number.non_zero_digit }
    post_code           { '123-4567' }
    prefecture          { 2 }
    city                { '東京都' }
    block               { '1-1' }
    building            { '東京ハイツ' }
    price               { 2000 }
    phone_number        { Faker::PhoneNumber.phone_number }
  end
end
