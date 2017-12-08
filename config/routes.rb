Rails.application.routes.draw do

  root "static_pages#index"

  devise_for :users, controllers: { sessions: "users/sessions"}
    namespace :admin do
      resources :superheroes
    end

  resources :superheroes, only: [:index, :show]
  resources :users, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :superheroes, only: [:index, :show, :create]
    end
  end
end
