class Item < ApplicationRecord
  
  has_many   :item_images
  belongs_to :category, optional: true
  # belongs_to :brand, optional: true
  belongs_to :prefecture, optional: true
  belongs_to :size, optional: true
  belongs_to :condition, optional: true
  belongs_to :delivery_fee, optional: true
  belongs_to :delivery_way, optional: true
  belongs_to :delivery_date, optional: true
  accepts_nested_attributes_for :item_images, allow_destroy: true

end




# has_oneの使い方が間違っていた時はReadMeファイルと共にbelongs_toに修正。r