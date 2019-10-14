class Item < ApplicationRecord
  has_many   :item_images
  # accepts_nested_attributes_for :item_images
  # belongs_to :category
  # belongs_to :brand
  # belongs_to :prefecture
  # belongs_to :size
  has_one :condition
  has_one :delivery_fee
  has_one :delivery_way
  has_one :delivery_date
end




# has_oneの使い方が間違っていた時はReadMeファイルと共にbelongs_toに修正。r