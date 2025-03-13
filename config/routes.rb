Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define your application routes
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA service worker & manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "customers#index"

  #  Custom Routes for Missing Email & Alphabetized Customers
  get "customers/missing_email", to: "customers#missing_email", as: :customers_missing_email
  get "customers/alphabetized", to: "customers#alphabetized", as: :customers_alphabetized
end
