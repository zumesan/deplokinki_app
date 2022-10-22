Rails.application.routes.draw do
  devise_for :users
  root to: "deplos#index"
  get '/deplos/prefecture/:id', to: "deplos#prefecture"
  resources :deplos do
    collection do
      get 'search'
    end
  end
end
