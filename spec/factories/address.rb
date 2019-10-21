FactoryBot.define do

  factory :address do
    postcode          {"123-4567"}
    # prefecture_id     {"東京都"}
    city              {"渋谷区"}
    address           {"神南1"}
    building_name     {"フレーム神南坂"}
    user_id           {1}
  end

end