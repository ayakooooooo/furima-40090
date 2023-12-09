class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date
  # これで ActiveHashのアソシエーション
  belongs_to :user
  has_one :orderend
  # これでテーブルのアソシエーション
  has_one_attached :image
  # これでActiveStorageのアソシエーション

  # カテゴリの選択「---」の時に保存できないようにするバリデーション
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank" }
end
