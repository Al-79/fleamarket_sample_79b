class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :brand
  has_many :item_images, dependent: :destroy
  belongs_to :user
  belongs_to_active_hash :size
  belongs_to_active_hash :condition
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture

  validates :name, presence:true, length: { maximum: 40 }
  validates :category,:size,:condition, :user_id, :price, :introduction,:preparation_day,:postage_payer,:prefecture,presence: true
  validates_associated :item_images
  validates :item_images, presence:true
end
