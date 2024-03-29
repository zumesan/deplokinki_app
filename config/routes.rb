Rails.application.routes.draw do
  get 'deplos/prefecture/users/show' => 'users#show'
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: 'users/registrations'
  }

  root to: "deplos#index"
  get '/deplos/prefecture/:id', to: "deplos#prefecture"
  get '/deplos/user/:id', to: 'deplos#userdetail', as: 'deplos_userdetail'
  resources :deplos do
    namespace :admin do
      resources :deplos, only: [:index, :new, :create, :show,  :edit, :destroy]
      resources :comments, only: [:destroy]
    end
    resources :comments, only: [:create, :destroy] 
    collection do
      get 'search'
    end
  end
end
