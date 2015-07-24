Postoss::Engine.routes.draw do
  root 'dashboard#index'

  resources :categories, except: [:show]
  resources :posts, except: [:show]

  resources :images, only: [:index, :create, :destroy]

  namespace :api, default: { format: :json } do
    resources :tags, only: [:index, :create]
  end
end
