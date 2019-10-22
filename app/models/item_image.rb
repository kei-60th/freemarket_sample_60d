class ItemImage < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ImageUploader
  validates :image, 
    presence: { comment: "画像がありません"}
  validates :item_id, presence: true
end
