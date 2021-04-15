Rails.application.routes.draw do
  #get 'articles/index'
  #get 'articles/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index' 
  resources :articles
  resources :items, only: [:new, :create, :index]
end
