Rails.application.routes.draw do
<<<<<<< Updated upstream
  devise_for :users
=======
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }

  devise_scope :user do
    get "/login", :to => "users/sessions#new"
    get "/registration/information", :to => "users/registrations#new"
    get "/registration/address", :to => "users/registrations#edit"
  end

>>>>>>> Stashed changes
root "items#index"
get '/logout', to: 'mypage#logout'
get '/mypage', to: 'mypage#mypage'
get '/mypage/card', to: 'mypage#index'
get '/mypage/card/create', to: 'mypage#create'
<<<<<<< Updated upstream
get '/registration', to: 'registrations#index'
get '/registration', to: 'registration#confirmation'
get '/registration/new', to: 'sessions#new'
get '/login', to: 'users#new'
=======
get "/registration/confirmation", to: "sms_confirmation#edit"

get '/signin', to: 'users#new'

>>>>>>> Stashed changes
get '/toppage', to: 'test#index'
end
