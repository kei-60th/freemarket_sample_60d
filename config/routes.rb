Rails.application.routes.draw do
  devise_for :users,controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
    devise_scope :user do
    get "/login", :to => "users/sessions#new"
    get "/registration/information", :to => "users/registrations#new"
    post "/registration/information/create", :to => "users/registrations#create"
  end

resources :addresses, only: [:create]
resources :creditcards, only: [:new, :create]

resources :items
resources :mypage, only: [:index, :show, :edit]

root "items#index"

resources :items do
  member do 
    get "item_status"
  end
end

get '/toppage', to: 'test#index'
get '/signin', to: 'users#new'
get '/logout', to: 'mypage#logout'
get '/registration', to: 'registration#confirmation'
get "/registration/confirmation", to: "sms_confirmation#edit"
get "/registration/address", to: "addresses#new"


get '/profile', to: 'profile#index'
get '/mypage/card', to: 'mypage#index'
get '/mypage/card/create', to: 'mypage#create'
get '/registration', to: 'registrations#index'
get '/registration/new', to: 'sessions#new'
get "/registration/compleate", to: "compleate#edit"

get "/item", to: "item_details#index"
get "/item/item_status", to: "items#item_status"
get "/item/category_children", to: "items#category_children"

get "/privacypolicy", to: 'privacypolicy#index'

resources :items do
  get "/order/confirmation", to: "orders#show"
  post "/order/confirmation", to: "orders#create"
end
end

