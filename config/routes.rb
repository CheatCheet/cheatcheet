# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  devise_for :users, skip: [:registrations], controllers: { omniauth_callbacks: 'devise/callbacks' }

  # TODO: omniauth is the only login option
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
  #   get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  # end
  resources :posts
end
