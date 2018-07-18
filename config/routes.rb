Rails.application.routes.draw do
  get '/keyboard' => 'kakao#keyboard'
  post '/message' => 'kakao#message'


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
      get :search
      # post '/search_restaurant' => 'restaurants#search_restaurant'
      get '/search_result' => 'restaurants#search_result'
    end
    # get '/search' => 'restaurants#solr_search'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
