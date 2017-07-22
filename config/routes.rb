Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope :path => "/api" do
    resources :tasks do
      # resources :categories do
      #   resources :categories
      # end
      resources :instections
    end

    resources :categories do
      resources :categories
    end
  end
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
