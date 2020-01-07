Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end

  root 'events#index'

  get 'search', to: 'events#search'

  get 'users/:id/portfolio', to: 'users#portfolio'


  resources :events
  resources :users
  resources :user_events, only: [:create, :destroy]
  patch 'check_attend', to: 'user_events#check_attend'
end
