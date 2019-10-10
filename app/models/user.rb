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
  # has_one :address
  # has_one :payment
  # has_one :creditcard
  # has_one :evaluation

  validates :nickname, null: false
  validates :nickname, uniqueness: true
  validates :last_name, null: false
  validates :first_name, null: false
  validates :last_name_kana, null: false
  validates :first_name_kana, null: false
  validates :email, null: false
  validates :email, uniqueness: true
  validates :password, null: false
  validates :birth_year, null: false
  validates :birth_month, null: false
  validates :birth_day, null: false
end
