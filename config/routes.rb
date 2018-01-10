Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

  resources :projects
  resources :tasks do
    resources :comments, shallow: true
  end

  namespace :api do
    namespace :v1 do
      resources :comments
      resources :projects
      resources :tasks
      resources :tokens, only: %i(create)
    end
  end

  devise_for :users

  root "pages#welcome"
end
