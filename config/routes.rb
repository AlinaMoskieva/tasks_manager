Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  resources :tasks do
    resources :comments, shallow: true
  end
  resources :projects

  devise_for :users

  root "pages#welcome"
end
