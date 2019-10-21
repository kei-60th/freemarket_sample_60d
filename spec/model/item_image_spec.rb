# require 'rails_helper'

# RSpec.describe Item_Image, type: :model do
#   describe '#create' do

#   before do
#     item = create{:item}
#   end
#     context "can not save" do

#       # 登録不可能（image空欄）
#       it "画像がないと保存できない" do
#         item_image = build(:item_image, image: nil)
#         item_image.valid?
#         expect(item_image.errors[:image]).to include("画像がありません")
#       end

      # # 登録不可能（item_id空欄）
      # it "is invalid without item_id" do
      #   image = build(:item_image, item_id: nil)
      #   image.valid?
      #   expect(image.errors[:item_id]).to include("入力してください")
      # end
      
#     end
#   end
# end