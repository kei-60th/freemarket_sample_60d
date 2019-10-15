FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    last_name             {"あ"}
    first_name            {"あ"}
    last_name_kana        {"ア"}
    first_name_kana       {"ア"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    #phone_number          {"09012345678"}
    birth_year            {1990}
    birth_month           {1}
    birth_day             {1}
  end

end