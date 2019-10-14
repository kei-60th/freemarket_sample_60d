Rails.application.routes.draw do
root "items#index"
# get 'items/new', to: 'items#new'
# get 'items/create', to: 'items#create'
get '/logout', to: 'mypage#logout'
get '/mypage/card', to: 'mypage#index'
get '/mypage/card/create', to: 'mypage#create'
get '/registration', to: 'registrations#index'
get '/registration/new', to: 'sessions#new'
get '/login', to: 'users#new'

resources :items, only: [:new, :create, :index]
#商品関連ページ
end
