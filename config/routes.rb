Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root 'spots#index'
  resources :maps, only: [:index]
  resources :spots do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :spots
  get 'spots/new/:category' => 'spots#new'
  get 'spots/index' => 'spots#index'
  get 'spots/top' => 'spots#top'
end