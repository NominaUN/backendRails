Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :options
      resources :logs
      resources :users
      resources :general_parameters
      resources :payday_details
      resources :payday_masters

      resources :areas
      resources :positions
      resources :employees
      resources :vacations

      resources :fonds
      resources :fond_employees
      resources :novelties
      resources :concepts
    end
  end

end
