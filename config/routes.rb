# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :manifesto_items
  resources :manifesto_sections
  resources :manifestos

  root to: 'home#index'
end
