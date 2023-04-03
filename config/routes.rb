Rails.application.routes.draw do
  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get "/dashboard" => 'dashboard#index',as: :dashboard
  get 'dashboard/properties'
  get 'dashboard/report'
  devise_for :agents
  get 'public/main'
  get 'properties/index'
  get 'properties/new'
  get 'properties/show'
  get 'properties/edit'
  get 'agents/index'
  get 'agents/new'
  get 'agents/show'
  get 'agents/edit'
  resources:companies
  resources:agents do
    resources :comments
  end
  resources:properties do
    resources :comments
  end

  resources:appointments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'public#main'
end
