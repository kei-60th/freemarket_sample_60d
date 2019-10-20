require 'rails_helper'
describe Address do
  describe '#create' do
    it "入力が正しいとき有効" do
      user = create(:user, id: 1)
      address = build(:address)
      expect(address).to be_valid
    end

    it "postcodeが空欄のとき無効" do
        address = build(:address, postcode: "")
        address.valid?
        expect(address.errors[:postcode]).to include("郵便番号を入力してください")
    end

    it "postcodeの桁数が誤っているとき無効" do
        address = build(:address, postcode: "1234-5678")
        address.valid?
        expect(address.errors[:postcode]).to include("数字とハイフンの位置は正しく入力してください")
    end

    it "postcodeのハイフンがないとき無効" do
        address = build(:address, postcode: "1234567")
        address.valid?
        expect(address.errors[:postcode]).to include("数字とハイフンの位置は正しく入力してください")
    end


    it "cityが空欄のとき無効" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("市区町村を入力してください")
    end

    it "cityが半角文字を含むとき無効" do
      address = build(:address, city: "渋谷1区")
      address.valid?
      expect(address.errors[:city]).to include("全角文字で入力してください")
    end


    it "addressが空欄のとき無効" do
      address = build(:address, address: "")
      address.valid?
      expect(address.errors[:address]).to include("番地を入力してください")
    end


    it "userと紐づいていないとき無効" do
      address = build(:address, user_id: "")
      address.valid?
      expect(address.errors[:user_id]).to include("can't be blank")
    end
  end
end