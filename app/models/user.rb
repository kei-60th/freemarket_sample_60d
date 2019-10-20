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

  validates :nickname, presence: true
  validates :nickname, uniqueness: true
  validates :last_name, presence: true, format: { with: /\A[^a-zA-Z0-9]+\z/,
    message: "全角文字で入力してください" }
  validates :first_name, presence: true, format: { with: /\A[^a-zA-Z0-9]+\z/,
    message: "全角文字で入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヴ]+\z/,
    message: "全角カタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヴ]+\z/,
    message: "全角カタカナで入力してください" }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 7, too_short: "パスワードは7文字以上です" }
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  #validates :prefecture_id, presence: true
end
