# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  devise_for :users, skip: [:registrations], controllers: { omniauth_callbacks: 'devise/omniauth' }

  namespace :users do
    resources :posts, only: :index
  end

  resources :posts do
    resources :bookmarks, only: %i[create]
    resources :votes, only: :create, module: 'posts'
  end

  namespace :bookmarks do
    resources :posts, only: %i[index]
  end

  resources :bookmarks, only: %i[destroy]
end
