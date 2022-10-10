Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'pages#home'


  resources :hosts
  resources :sessions

  # user controller

  get 'dashboard', to: 'users#dashboard'
  get 'profile', to: 'users#profile'
  get 'find_a_pole', to: 'users#find_a_pole'
  get 'share', to: 'users#share'





  # pages controller

  get 'home', to: 'pages#home'
  get 'tutorials', to: 'pages#tutorials'
  get 'shop', to: 'pages#shop'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
