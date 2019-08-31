Rails.application.routes.draw do
  resources :manifesto_items
  resources :manifesto_sections
  resources :manifestos

  root to: 'home#index'
end
