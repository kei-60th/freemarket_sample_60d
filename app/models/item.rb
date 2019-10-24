class Item < ApplicationRecord
  
  has_many   :item_images, dependent: :delete_all
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  belongs_to :prefecture, optional: true
  belongs_to :size, optional: true
  belongs_to :condition, optional: true
  belongs_to :delivery_fee, optional: true
  belongs_to :delivery_way, optional: true
  belongs_to :delivery_date, optional: true
  belongs_to :user, optional: true
  accepts_nested_attributes_for :item_images

  validates :name,
    presence: { message: "入力してください" },
    length: { maximum: 40, message: "40文字以下で入力してください" }
  validates :price,
    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "販売価格は300以上9,999,999以内で入力してください" }
  validates :description,
    presence: { message: "入力してください" },
    length: { maximum: 1000, message: "1000文字以下で入力してください" }
  validates :condition_id,
    presence: { message: "選択して下さい" }
  validates :prefecture_id,
    presence: { message: "選択して下さい" }
  validates :delivery_fee_id,
    presence: { message: "選択して下さい" }
  validates :delivery_date_id,
    presence: { message: "選択して下さい" }
  validates :delivery_way_id,
    presence: { message: "選択して下さい" }
  validates :category_id,
    numericality: { greater_than: 0, message: "選択して下さい" }
    # validates :brand,
    #   length: { maximum: 40 }
  # validates :user_id,
  #   presence: true
  # validates :size_id,
  #   numericality: { greater_than: 0, message: "選択して下さい" }
end



