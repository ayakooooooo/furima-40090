FactoryBot.define do
  factory :order_address do
    item_id             { Faker::Number.non_zero_digit }
    user_id             { Faker::Number.non_zero_digit }
    post_code           { '123-4567' }
    prefecture_id       { 2 }
    city                { '東京都' }
    block               { '1-1' }
    building            { '東京ハイツ' }
    phone_number        { Faker::Number.decimal_part(digits: 11) }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
