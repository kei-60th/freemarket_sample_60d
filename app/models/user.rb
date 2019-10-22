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
  # belongs_to :prefecture
  # has_one :payment
  # has_one :creditcard
  # has_one :evaluation

  def name
    last_name + ' ' + first_name
  end

  def name_kana
    last_name_kana + ' ' + first_name_kana
  end

  def birth_date
    birth_year.to_s + '/' + birth_month.to_s + '/' + birth_day.to_s
  end
      

  # <-----------SNSログイン関係----------->
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present? #sns登録のみ完了してるユーザー
      user = User.where(id: snscredential.user_id).first
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          # snsの情報
          # binding.pry => auth.infoとかで確認 
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential
      #binding.pry

    else #sns登録 未
      user = User.where(email: auth.info.email).first
      if user.present? #会員登録 済
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else #会員登録 未
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
        # binding.pry
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
        # binding.pry
      end
    end
    # binding.pry
    # hashでsnsのidを返り値として保持しておく
    return { user: user , sns_id: sns.id }
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