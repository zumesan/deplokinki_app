Rails.application.routes.draw do
  devise_for :users
  root to: "deplos#index"
  resources :deplos, only: [:index, :new, :show, :create] do
    resources :deplomies, only: :index
    resources :deploshigas, only: :index
    resources :deplokyotos, only: :index
    resources :deploosakas, only: :index
    resources :deplohyogos, only: :index 
    resources :deplonaras, only: :index
    resources :deplowakayamas, only: :index
  end
end
