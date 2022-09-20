Rails.application.routes.draw do
  root to: "deplos#index"
  resources :deplos, only: [:new]
end
