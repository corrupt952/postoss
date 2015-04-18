Postoss::Engine.routes.draw do
  root 'dashboard#index'

  resources :categories, except: [:show]
  resources :posts, except: [:show]

  resources :images, only: [:index, :create, :destroy]
end
