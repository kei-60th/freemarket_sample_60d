require 'rails_helper'

  RSpec.describe Item, type: :model do
    describe '#create' do
    
    before do
      category = create(:category)
      condition = create(:condition)
      delivery_date = create(:delivery_date)
      delivery_fee = create(:delivery_fee)
      delivery_way = create(:delivery_way)
      prefecture = create(:prefecture)
    end

    # 登録可能（全項目あり）
      context "can save" do
        it "is valid with all propeties" do
          item = build(:item)
          expect(item).to be_valid
        end
      end

        # 登録不可能
      context "can not save" do
        it "商品名がないと登録できない" do
          item = build(:item, name: nil)
          item.valid?
          expect(item.errors[:name]).to include("入力してください")
        end

        it "商品名40文字以上では登録できない" do
          item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"  )
          item.valid?
          expect(item.errors[:name]).to include("40文字以下で入力してください")
        end

        it "商品説明がないと登録できない" do
          item = build(:item, description: nil)
          item.valid?
          expect(item.errors[:description]).to include("入力してください")
        end

        # it "商品説明が1,000文字以上では登録できない" do
        #   item = build(:item, descrption: Faker::Lorem.characters(1001))
        #   item.valid?
        #   expect(item.errors[:description]).to include("1,000文字以下で入力してください")
        # end

        it "価格がないと登録できない" do
          item = build(:item, price: nil)
          item.valid?
          expect(item.errors[:price]).to include("販売価格は300以上9,999,999以内で入力してください")
        end

        it "価格が299以下で登録できない" do
          item = build(:item, price: 299)
          item.valid?
          expect(item.errors[:price]).to include("販売価格は300以上9,999,999以内で入力してください")
        end

        it "価格が10000000以上で登録できない" do
          item = build(:item, price: 10000000)
          item.valid?
          expect(item.errors[:price][0]).to include("販売価格は300以上9,999,999以内で入力してください")
        end

        it "カテゴリーが空欄では登録できない" do
          item = build(:item, category_id: nil)
          item.valid?
          expect(item.errors[:category_id]).to include("選択して下さい")
        end

        it "コンディションが空欄では登録できない" do
          item = build(:item, condition_id: nil)
          item.valid?
          expect(item.errors[:condition_id]).to include("選択して下さい")
        end

        it "都道府県が空欄では登録できない" do
          item = build(:item, prefecture_id: nil)
          item.valid?
          expect(item.errors[:prefecture_id]).to include("選択して下さい")
        end

        it "配送料が空欄では登録できない" do
          item = build(:item, delivery_fee_id: nil)
          item.valid?
          expect(item.errors[:delivery_fee_id]).to include("選択して下さい")
        end

        it "配送の方法が空欄では登録できない" do
          item = build(:item, delivery_way_id: nil)
          item.valid?
          expect(item.errors[:delivery_way_id]).to include("選択して下さい")
        end

        it "発送までの日数が空欄では登録できない" do
          item = build(:item, delivery_date_id: nil)
          item.valid?
          expect(item.errors[:delivery_date_id]).to include("選択して下さい")
        end
      end
    end
  end
