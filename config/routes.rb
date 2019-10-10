Rails.application.routes.draw do
  devise_for :users
root "items#index"
get '/logout', to: 'mypage#logout'
get '/mypage', to: 'mypage#mypage'
get '/mypage/card', to: 'mypage#index'
get '/mypage/card/create', to: 'mypage#create'
get '/registration', to: 'registrations#index'
get '/registration/new', to: 'sessions#new'
get '/login', to: 'users#new'
get '/toppage', to: 'test#index'
end
