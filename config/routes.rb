Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope :path => "/api" do
    resources :settings
    resources :tasks do
      # resources :categories do
      #   resources :categories
      # end
      resources :inspections
    end
    resources :inspections

    resources :categories do
      resources :categories
    end
  end
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
