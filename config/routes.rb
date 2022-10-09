Rails.application.routes.draw do
  devise_for :users
  root to: "deplos#index"
  get '/deplos/prefecture/:id', to: "deplos#prefecture"
  resources :deplos, only: [:index, :new, :show, :create, :edit, :update]
end
