Rails.application.routes.draw do
root "items#index"
get '/logout', to: 'mypage#logout'
get '/mypage/card', to: 'mypage#profile'
get '/mypage/card', to: 'mypage#index'
get '/mypage/card/create', to: 'mypage#create'
get '/registration', to: 'registrations#index'
get '/registration/new', to: 'sessions#new'
get '/login', to: 'users#new'
end
