# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  devise_for :users, skip: [:registrations], controllers: { omniauth_callbacks: 'devise/omniauth' }

  resources :posts

  namespace :users do
    resources :posts, only: :index
  end

  resources :posts do
    resources :bookmarks, only: %i[create]
  end

  resources :bookmarks, only: %i[destroy]
end
