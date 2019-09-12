# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :manifesto_items, only: [:show]
  resources :manifesto_sections, only: [:show]
  resources :manifestos, only: [:index, :show]
  resources :parties, only: [:index, :show]

  resources :comments, only: [:create, :update, :delete]
  resources :annotations, only: [:create, :update, :delete]

  root 'pages#index'

  # IMPORTANT #
  # This `match` must be the *last* route in routes.rb
  match '*path', to: 'pages#index', via: :all
end
