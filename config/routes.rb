Rails.application.routes.draw do
  devise_for :users

  root "users#show"
  resources :incomes, only: [:new, :create]
  resources :spendings, only: [:new, :create]
end