FactoryBot.define do
  factory :item do
    association :user
    # Itemのインスタンスが生成したと同時に、関連するUserのインスタンスも生成される

    product_name     { Faker::Commerce }
    description      { Faker::Lorem.sentence }#sentenceはデフォルトで4つの単語を組み合わせて文
    category_id      { 4 }
    status_id        { 4 }
    shipping_cost_id { 4 }
    prefecture_id    { 4 }
    shipping_date_id { 4 }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      # インスタンス生成後に画像が保存されるように
      # io: File.openで設定したパスのファイル（public/images/test_image.png）を、test_image.pngというファイル名で保存
    end
  end
end
