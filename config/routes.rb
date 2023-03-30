Rails.application.routes.draw do
  devise_for :users

  root "users#show"
  resources :incomes, only: [:new, :create, :edit, :update, :destroy]
  resources :spendings, only: [:new, :create, :edit, :update, :destroy]
end