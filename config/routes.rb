# frozen_string_literal: true

Rails.application.routes.draw do


  devise_scope :user do
    get '/users/:role/sign_up', to: 'users/registrations#new', as: :new_user_registration
    root to: "users/sessions#new"
  end

  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations'}
  
  namespace :seller do
    resources :products
  end

  resources :products

end
