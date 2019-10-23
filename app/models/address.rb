class Address < ApplicationRecord
  has_many :item
  belongs_to :prefecture

  validates :postcode,
    presence: {
      message: "郵便番号を入力してください"
    },
    format: {
      with: /\A\d{3}-\d{4}\z/,
      message: "数字とハイフンの位置は正しく入力してください"
    }
  validates :city,     
    presence: {
      message: "市区町村を入力してください"
    },
    format: {
      with: /\A[^a-zA-Z0-9]+\z/,
      message: "全角文字で入力してください"
    }
  validates :address,
    presence: {
      message: "番地を入力してください"
    }
  validates :user_id,
    presence: true
end
