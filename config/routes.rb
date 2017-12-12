Rails.application.routes.draw do

  root "static_pages#index"

  resources :superheroes, only: [:index, :show, :destroy] do
    resources :reviews, only: [:index, :show, :create, :destroy]
  end

  devise_for :users, controllers: { sessions: "users/sessions"}
    namespace :admin, controllers: { sessions: "users/sessions"} do
      resources :superheroes
    end

  resources :superheroes, only: [:index, :show, :destroy]
  resources :users, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :superheroes, only: [:index, :show, :create, :destroy] do
        resources :reviews, only: [:index, :show, :create, :destroy]
      end
    end
  end
end
