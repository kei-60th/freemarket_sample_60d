class User < ApplicationRecord
  ## Include default devise modules. Others available are:
  ## :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :sns_credentials, dependent: :destroy

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
  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

   def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    password = Devise.friendly_token.first(7)
    #binding.pry

    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end

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