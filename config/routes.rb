Rails.application.routes.draw do
  devise_for :users
  root to: "deplos#index"
  post 'deplos', to: 'deplos#new'
  resources :deplos, only: [:new]
end
