class User < ApplicationRecord
  ## Include default devise modules. Others available are:
  ## :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
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

  # <-----------SNSログイン関係----------->
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

  validates :nicknamde, presence: true
  validates :nickname, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  #validates :prefecture_id, presence: true
end
