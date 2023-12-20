FactoryBot.define do
  factory :order_address do
    post_code           { '123-4567' }
    prefecture_id       { 2 }
    city                { '東京都' }
    block               { '1-1' }
    building            { '東京ハイツ' }
    phone_number        { Faker::Number.decimal_part(digits: 11) }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
