Rails.application.routes.draw do
  devise_for :users

  root "users#show"
  resources :incomes, only: [:new, :create, :destroy]
  resources :spendings, only: [:new, :create, :destroy, :show]
end