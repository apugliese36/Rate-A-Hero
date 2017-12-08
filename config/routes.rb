Rails.application.routes.draw do

  devise_for :users
  root "static_pages#index"

  resources :superheroes, only: [:index, :show] do
    resources :reviews, only: [:index, :show, :create]
  end


  namespace :api do
    namespace :v1 do
      resources :superheroes, only: [:index, :show, :create]
    end
  end
end
