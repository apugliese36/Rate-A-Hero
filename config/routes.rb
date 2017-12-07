Rails.application.routes.draw do

  devise_for :users
  root "static_pages#index"

  resources :superheroes, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :superheroes, only: [:index, :show, :create]
    end
  end
end
