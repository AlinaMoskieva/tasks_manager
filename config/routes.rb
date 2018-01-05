Rails.application.routes.draw do
  resources :tasks do
    resources :comments, shallow: true
  end
  resources :projects

  devise_for :users

  root "pages#welcome"
end
