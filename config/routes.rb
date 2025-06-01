Rails.application.routes.draw do

  devise_for :users, path: "", :sign_out_via => [ :get ]
  devise_scope :user do
    get '/login', to: 'users/sessions#new'
  end
  
  # Defines the root path route ("/")
  root "static#home"
  
  # admin
  namespace :admin do
    get '/' => 'dashboard#index'
    
    resources :blocks
    resources :images
    resources :pages
    resources :programs do
      resources :themes do
        resources :topics
      end
    end

    resources :quotations do
      member do
        get 'show', defaults: { format: 'html' }
        get 'show.pdf', to: 'quotations#show', defaults: { format: 'pdf' }
      end
    end
  end

  # Public routes
  resources :topics, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Errors
  # https://guides.rubyonrails.org/v4.2.0/action_controller_overview.html#custom-errors-page
  match "404",     via: :all, to: "errors#not_found",            as: :not_found
  match "422",     via: :all, to: "errors#unprocessable_entity", as: :unprocessable_entity
  match "500",     via: :all, to: "errors#server_error",         as: :server_error
  match 'offline', via: :all, to: 'errors#offline',              as: :offline

end
