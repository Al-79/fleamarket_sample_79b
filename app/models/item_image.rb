class ItemImage < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :item
  belongs_to_active_hash :prefecture

  mount_uploader :image, ImageUploader
end
