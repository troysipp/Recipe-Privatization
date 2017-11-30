Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'recipes#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    member do
      get 'favorites'
    end
  end

  resources :sessions

  resources :recipes do
    member do
      post 'add_favorite'
      delete 'remove_favorite'
    end
    resources :comments
  end

end
