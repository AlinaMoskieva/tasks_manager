Rails.application.routes.draw do
  resources :tasks
  resources :projects

  devise_for :users

  root "pages#welcome"
end
