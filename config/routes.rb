Rails.application.routes.draw do
  resources :manifesto_items
  resources :manifesto_sections
  resources :manifestos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
