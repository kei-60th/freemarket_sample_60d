FactoryBot.define do

  factory :item do
    
    association :category
    association :prefecture 
    association :condition 
    association :delivery_fee
    association :delivery_way
    association :delivery_date 
    name                 { "wallet"} 
    price                { 100000 }
    description          { "オススメの商品です"}
    category_id          {1}
    prefecture_id        {1}
    condition_id         {1}
    delivery_fee_id      {1}
    delivery_way_id      {1}
    delivery_date_id     {1}
    # user_id
    # after(:build) do |item|
    #   item.item_images << build(:item_image, item: item)
  end
end
