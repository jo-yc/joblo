Rails.application.routes.draw do

  devise_for :administrators
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'home#index'

  constraints subdomain: /blog/ do
    namespace :blog, :path => '/' do
      get '/', to: 'home#index', as: :root
      resources :home, only: :index
      namespace :posts do
        resources :prayer_requests, only: [:index, :show]
        resources :drama_team, only: [:index, :show]
        resources :korean_ministry, only: [:index, :show]
        resources :devotion, only: [:index, :show]
        resources :family, only: [:index, :show]
        resources :daily_life, only: [:index, :show]
      end
    end
  end

  constraints subdomain: // do
    get '/', to: 'home#index', as: :root
    resources :home
    namespace :admin do
      resources :dashboard, only: :index
      namespace :blog do
        resources :posts do
          post :posting, on: :member
          post :undo, on: :member
        end
      end
    end
  end

  namespace :api, defaults: {format: :json} do
    namespace :blog do
      resources :home, only: :index
      resources :posts, only: [:index, :show] do
        resources :image_sort do
          put :sort, on: :member
        end
      end
    end
  end
end
