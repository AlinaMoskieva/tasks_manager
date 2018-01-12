Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

  resources :projects
  resources :tasks do
    resources :comments, shallow: true
  end

  namespace :api do
    namespace :v1 do
      resources :comments, only: %i(create destroy)
      resources :projects, only: %i(create index show destroy)
      resources :tasks, only: %i(create show destroy)
      resources :tokens, only: %i(create)
    end
  end

  devise_for :users

  root "pages#welcome"
end
