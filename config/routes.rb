Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :general_parameters
      resources :payday_details, defaults: {format: :json}
      resources :payday_masters, defaults: {format: :json}

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
