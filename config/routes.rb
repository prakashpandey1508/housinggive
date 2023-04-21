Rails.application.routes.draw do
  

  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  namespace :api do
    resources :properties
  end

  namespace :api do
    namespace :v1 do
      resources :comments
    end
  end
  namespace :api do
    namespace :v1 do
     resources :appointments
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :properties do
      member do
        get:property_comments
        get:property_appointments
      end
    end
  end
end

namespace :api do
    resources :properties do
    member do
      get:property_comments
      get:property_appointments
    end
  end

end
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'
  get "/dashboard" => 'dashboard#index',as: :dashboard
  get 'dashboard/properties'
  get 'dashboard/report'
  devise_for :agents
  get 'public/main'
  resources:companies
  resources:agents do
    resources :comments
  end
  resources:properties do
    resources :comments
    resources :appointments, only: [:index, :new, :create]
  end

  resources:appointments do
    member do
      get 'properties_appointment'
    end
  end
  resources :users
  resources :propertytype
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'public#main'
end
