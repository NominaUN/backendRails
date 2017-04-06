Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :options
  resources :logs
  resources :users
  resources :general_parameters
  resources :payday_details
  resources :payday_masters
end
