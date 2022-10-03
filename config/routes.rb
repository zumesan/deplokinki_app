Rails.application.routes.draw do
  get 'deplonaras/index'
  get 'deplowakayamas/index'
  get 'deplohyogos/index'
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
    resources :deplohyogos, only: :index 
  end
end
