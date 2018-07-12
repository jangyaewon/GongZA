Rails.application.routes.draw do
  devise_for :users
  root 'restaurants#index'
  
  resources :restaurants do
    member do
    end
    
    collection do
      get '/search_restaurant' => 'restaurants#search_restaurant'
    end
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
