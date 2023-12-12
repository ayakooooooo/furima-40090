FactoryBot.define do
  factory :user do

    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    first_name            { '佐藤' }
    last_name             { '絢子' }
    first_name_kana       { 'サトウ' }
    last_name_kana        { 'アヤコ' }
    birthday              { Faker::Date.birthday }
  end
end
