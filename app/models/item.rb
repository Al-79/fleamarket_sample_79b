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

  validates :name, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :preparation_day_id, presence: true
  validates :postage_payer_id, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true
end
