Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "/login", :to => "users/sessions#new"
    get "/registration/information", :to => "users/registrations#new"
    post "/registration/information/create", :to => "users/registrations#create"
  end

resources :addresses, only: :update

root "items#index"

get '/toppage', to: 'test#index'

get '/signin', to: 'users#new'
get '/logout', to: 'mypage#logout'
get '/registration', to: 'registration#confirmation'
get "/registration/confirmation", to: "sms_confirmation#edit"
get "/registration/address", to: "addresses#new"
post "/registration/address/post", to: "addresses#create"

get "/registration/payment", to: "creditcards#new"
post "/registration/payment/post", to: "creditcards#create"

get '/mypage', to: 'mypage#mypage'
get '/mypage/card', to: 'mypage#index'
get '/mypage/card/create', to: 'mypage#create'

get "/registration/compleate", to: "compleate#edit"

end