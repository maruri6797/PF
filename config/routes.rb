Rails.application.routes.draw do

  devise_for :admin, controllers: {
    registrations: "admin/registrations",
    sessions: 'admin/sessions',
    passwords: 'admin/passwords'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'homes#top'
    resources :managers, only: [:index, :create, :destroy]
    resources :customers, only: [:index, :show]
    resources :admins, only: [:show, :edit, :update]
    resources :events, only: [:index]
  end

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

  scope module: :public do
    root to: 'homes#top'
    resources :events, except: [:new, :edit]
    resources :places, except: [:new, :show]
    resources :customers, only: [:edit, :show, :update]
  end
end
