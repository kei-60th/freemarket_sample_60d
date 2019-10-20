require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with data" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # it "is invalid without a phone_number" do
    #   user = build(:user, phone_number: "")
    #   user.valid?
    #   expect(user.errors[:phone_number]).to include("can't be blank")
    # end

    it "is invalid without a birth_year" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "is invalid without a birth_month" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    it "is invalid without a birth_day" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    it "is valid with different nickname and phone number" do
      user = build(:user)
      another_user = build(:user, nickname: "cde", email: "lll@gmail.com")
      expect(user).to be_valid
    end
    
    it "is invalid with a duplicate nickname" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("has already been taken")
    end
    
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    
    # it "is invalid with a duplicate phone_number" do
    #   user = create(:user)
    #   another_user = build(:user)
    #   another_user.valid?
    #   expect(another_user.errors[:phone_number]).to include("has already been taken")
    # end
  end
end

describe User do
  describe '#create' do
    it "パスワードが7文字のとき有効" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      expect(user).to be_valid
    end

    it "パスワードが7文字以下のとき無効" do
      user = build(:user, password: "123456")
      user.valid?
      expect(user.errors[:password]).to include("パスワードは7文字以上です")
    end

    it "パスワードが空欄のとき無効" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("パスワードは7文字以上です")
    end
  end
end

describe User do
  describe '#create' do
    it "苗字が空欄のとき無効" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "名前が空欄のとき無効" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "苗字が半角英数を含むとき無効" do
      user = build(:user, last_name: "アabcア", )
      user.valid?
      expect(user.errors[:last_name]).to include("全角文字で入力してください")
    end

    it "名前が半角英数を含むとき無効" do
      user = build(:user, first_name: "アabcア", )
      user.valid?
      expect(user.errors[:first_name]).to include("全角文字で入力してください")
    end
  end
end

describe User do
  describe '#create' do
    it "last_name_kanaが空欄とき無効" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaが空欄とき無効" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "お名前カナ(全角)が半角英数を含むとき無効" do
      user = build(:user, last_name_kana: "アabcア", )
      user.valid?
      expect(user.errors[:last_name_kana]).to include("全角カタカナで入力してください")

      user = build(:user, first_name_kana: "アabcア", )
      user.valid?
      expect(user.errors[:first_name_kana]).to include("全角カタカナで入力してください")
    end

    it "お名前カナ(全角)がひらがなを含むとき無効" do
      user = build(:user, last_name_kana: "あabcあ")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("全角カタカナで入力してください")

      user = build(:user, first_name_kana: "あabcあ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("全角カタカナで入力してください")
    end
  end
end