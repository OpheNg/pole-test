Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'pages#home'

  # user controller

  get 'dashboard', to: 'users#dashboard'
  get 'profile', to: 'users#profile'


  # pages controller

  get 'home', to: 'pages#home'
  get 'tutorials', to: 'pages#tutorials'
  get 'shop', to: 'pages#shop'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
