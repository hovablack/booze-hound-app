Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'auth/google_oauth2/callback', to: 'sessions#omniauth'
  get 'auth/failure', to: redirect('/')
  get 'register', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :reviews
  resources :drinks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
