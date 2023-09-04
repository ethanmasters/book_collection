Rails.application.routes.draw do
  resources :books do
    member do
      get 'destroy_confirm', to: 'books#destroy_confirm', as: 'destroy_confirm'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "books#index"
end
