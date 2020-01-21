# -*- encoding : utf-8 -*-
Rails.application.routes.draw do

  get 'groups/new'
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
  get 'users/:id/joiningEvent', to: 'users#joiningEvent',as: "user_joiningEvent"

  resources :events do
    patch :toggle_status
    collection do
        get 'confirm'
      end
  end
  resources :users
  resources :user_events, only: [:create, :destroy]
  resources :event_category, only: [:create, :destroy]
  get 'category/:name', to: 'category#show', as: 'category'
  get 'categories', to: 'category#index', as: 'categories'
  resources :groups
  resources :user_groups,only: [:create, :destroy]


  mount ActionCable.server => '/cable'
end
