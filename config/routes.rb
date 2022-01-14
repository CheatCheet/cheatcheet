# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  devise_for :users, skip: [:registrations], controllers: { omniauth_callbacks: 'devise/omniauth' }

  resources :posts do
    resources :votes, only: :create, module: 'posts'
  end

  namespace :users do
    resources :posts, only: :index
  end
end
