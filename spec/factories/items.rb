FactoryBot.define do
  factory :item do
    id {1}
    name {"アイテム"}
    price {"100000"}
    description {"商品説明欄"}
    order_status {1}
    category {1}
    size {1}
    user_id {1}
  end
end