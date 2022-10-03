Rails.application.routes.draw do
  get 'deploosakas/index'
  get 'deplokyotos/index'
  devise_for :users
  root to: "deplos#index"
  resources :deplos, only: [:index, :new, :create] do
    resources :deplomies, only: :index
    resources :deploshigas, only: :index
    resources :deploshigas, only: :index
    resources :deplokyotos, only: :index
    resources :deploosakas, only: :index

  end
end
