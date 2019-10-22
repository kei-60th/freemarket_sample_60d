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
resources :mypage, only: [:show, :edit]

root "items#index"

get '/toppage', to: 'test#index'
get '/signin', to: 'users#new'
get '/logout', to: 'mypage#logout'
get '/registration', to: 'registration#confirmation'
get "/registration/confirmation", to: "sms_confirmation#edit"
get "/registration/address", to: "addresses#new"


get '/mypage/card', to: 'mypage#index'
get '/mypage/card/create', to: 'mypage#create'
get '/registration', to: 'registrations#index'
get '/registration/new', to: 'sessions#new'
get "/registration/compleate", to: "compleate#edit"

get "/item", to: "item_details#index"

get "/privacypolicy", to: 'privacypolicy#index'

resources :items do
  get "/order/confirmation", to: "orders#show"
  post "/order/confirmation", to: "orders#create"
end
end

