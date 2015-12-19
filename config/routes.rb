Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: [:show] do
    resources :items, only: [:new, :create, :destroy]
  end
  
  root to:'welcome#index'

end