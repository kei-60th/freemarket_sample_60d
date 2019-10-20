class User < ApplicationRecord
  ## Include default devise modules. Others available are:
  ## :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  # has_many :orders
  # has_many :buyers, class_name: "user", through: orders
  # has_many :sellers, class_name: "user", through: orders
  # has_many :likes
  has_one :address
  has_one :creditcard
  # has_one :payment
  # has_one :creditcard
  # has_one :evaluation
  # belongs_to :prefecture

  validates :nickname,
    presence: {
      message: "ニックネームを入力してください"
    }
  validates :nickname,
    uniqueness: {
      message: "既に存在するニックネームです"
    }
  validates :last_name, 
    presence: {
      message: "名前を入力してください"
    },
    format: {
      with: /\A[^a-zA-Z0-9]+\z/,
      message: "全角文字で入力してください"
    }
  validates :first_name,
    presence: {
      message: "名前を入力してください"
    },
    format: {
      with: /\A[^a-zA-Z0-9]+\z/,
      message: "全角文字で入力してください"
    }
  validates :last_name_kana,
    presence: {
      message: "名前を入力してください"
    },
    format: {
      with: /\A[ァ-ヴ]+\z/,
      message: "全角カタカナで入力してください"
    }
  validates :first_name_kana,
    presence: {
      message: "名前を入力してください"
    },
    format: {
      with: /\A[ァ-ヴ]+\z/,
      message: "全角カタカナで入力してください"
    }
  validates :email,
    presence: {
      message: "メールアドレスを入力してください"
    }
  validates :email,
    uniqueness: {
      message: "既にアカウントが存在します"
    }
  validates :password,
    presence: true,
    length: {
      minimum: 7,
      too_short: "パスワードは7文字以上です"
    }
  validates :birth_year,
    presence: {
      message: "生年月日を入力してください"
    }
  validates :birth_month,
    presence: {
      message: "生年月日を入力してください"
    }
  validates :birth_day,
    presence: {
      message: "生年月日を入力してください"
    }
  #validates :prefecture_id, presence: true
end
