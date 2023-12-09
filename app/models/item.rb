class Item < ApplicationRecord
  belongs_to :user
  has_one :orderend
  has_one_attached :image
end
