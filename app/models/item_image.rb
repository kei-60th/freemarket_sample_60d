class ItemImage < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ImageUploader
  # 商品一覧機能にて、エラーになるので、下記を一旦コメントアウトします。10/15川添
  validates :image, 
    presence: { comment: "画像がありません"}
  validates :item_id, presence: true
end
