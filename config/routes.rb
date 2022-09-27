Rails.application.routes.draw do
  get 'deplolists/index'
  devise_for :users
  root to: "deplos#index"
  resources :deplos, only: [:index, :new, :create] do
    resources :deplolists, only: :index
  end
end
