class OrderAddress
  # クラスを定義
  include ActiveModel::Model
  # form_withメソッドに対応する機能とバリデーションを行う機能を、作成したクラスに持たせる
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :token
  # 保存したいすべての属性について、上記のように指定することで、ゲッターとセッターを定義
  # order_addressのインスタンスを生成するタイミングでは、donation_idは存在しない

  with_options presence: true do
    # 複数のバリデーションに共通の制限をかけたい with_optionsを使用する
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # addressモデルのバリデーション
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'should be in the format of 3 digits followed by a hyphen and then 4 digits' }
    # ３桁ハイフン４桁の半角文字列のみ保存可能
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    # 指定した属性の値が数値であること,もし1であればエラーメッセージ "can't be blank" を表示する設定,都道府県IDがオプションのセレクトボックスなどから選択されているかどうかを確認する
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'should be a 10 to 11 digit numeric value' }
    # 10桁以上11桁未満の半角数値のみを保存可能
    validates :token, presence: true
    # attr_accessor :tokenと記載したことにより、tokenについてのバリデーションを記述することができる
  end
  def save
    # データをテーブルに保存する処理
    order = Order.create(user_id: user_id, item_id: item_id)
    # Orderモデルの新しいレコードが作成され、そのレコードを表すOrderモデルのインスタンスがorder変数に代入,user_id属性にuser_id変数の値を、item_id属性にitem_id変数の値を設定
    Address.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
    # 住所を保存する order_idには、変数orderのidと指定する
  end
end
