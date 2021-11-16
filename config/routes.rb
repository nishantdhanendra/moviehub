Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :movies

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "movies#index"
  devise_for :viewers
  resources :viewers
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
