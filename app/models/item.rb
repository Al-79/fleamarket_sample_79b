class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :item_images, dependent: :destroy
  belongs_to :user
  belongs_to_active_hash :size
  belongs_to_active_hash :condition
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
end
