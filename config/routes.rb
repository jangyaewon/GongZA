Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/auth/kakao', to: 'users/omniauth_callbacks#kakao'
    get '/users/auth/kakao/callback', to: 'users/omniauth_callbacks#kakao_auth'
  end
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
