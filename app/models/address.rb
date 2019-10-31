class Address < ApplicationRecord

  has_many :items
  belongs_to :prefecture

  validates :postcode,
    presence: {
      message: "数字とハイフンの位置は正しく入力してください"
    },
    format: {
      with: /\A\d{3}-\d{4}\z/,
      message: "数字とハイフンの位置は正しく入力してください"
    }
  validates :prefecture_id,
    presence: {
      message: "都道府県を選択して下さい"
    }
  validates :city,     
    presence: {
      message: "市区町村を全角文字で入力してください"
    },
    format: {
      with: /\A[^a-zA-Z0-9]+\z/,
      message: "市区町村を全角文字で入力してください"
    }
  validates :address,
    presence: {
      message: "番地を入力してください"
    }
  validates :user_id,
    presence: true
end
