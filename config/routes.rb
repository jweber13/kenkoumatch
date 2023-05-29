Rails.application.routes.draw do
  devise_for :users
  root to: "practices#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :practices, only: %i[index show] do
    resources :cards, only: %i[new create]
    resources :institutions, only: %i[index show new create]
  end
  resources :cards, only: %i[index show update destroy] do
    member do
      post :redo
    end
  end
end
