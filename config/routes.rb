Rails.application.routes.draw do

  root "static_pages#index"

  resources :superheroes, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :superheroes, only: [:index, :show]
    end
  end
end
