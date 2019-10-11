Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "/login", :to => "users/sessions#new"
    get "/registration/information", :to => "users/registrations#new"
  end

root "items#index"
get '/logout', to: 'mypage#logout'
get '/mypage', to: 'mypage#mypage'
get '/mypage/card', to: 'mypage#index'
get '/mypage/card/create', to: 'mypage#create'

get '/signin', to: 'users#new'

get '/registration', to: 'registration#confirmation'
get '/toppage', to: 'test#index'
end
