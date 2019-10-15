class ItemImage < ApplicationRecord
  belongs_to :item
  # 商品一覧機能にて、エラーになるので、下記を一旦コメントアウトします。10/15川添
  # mount_uploader :image, ImageUploader
end
