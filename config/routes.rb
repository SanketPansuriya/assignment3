Rails.application.routes.draw do
  resources :books 
  resources :authers do
    member do
      resources :picture, only: [] do
        delete :destroy_picture, controller: :authers
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "authers#index"
end
