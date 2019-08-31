# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :manifesto_items
  resources :manifesto_sections
  resources :manifestos

  root to: 'home#index'
end
