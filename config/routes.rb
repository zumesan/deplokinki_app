Rails.application.routes.draw do
  devise_for :users
  root to: "deplos#index"
  resources :deplos, only: [:new]
end
