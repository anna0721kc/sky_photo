Rails.application.routes.draw do
  devise_for :customers, controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions',
  }
  devise_for :admins,path: 'admin',controllers: {
  registrations: 'admin/registrations',
  sessions: 'admin/sessions',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #会員側
  scope module: :public do
    resources :photos
    root to: 'homes#top'
    resources :customers do
      resources :favorites, only: [:index]
      member do
        get :following, :followers
      end
      resources :relationships, only: [:create, :destroy]

    end
    get '/about' => 'homes#about'
    get '/customers/:id/follow' => 'customers#follow'
    get '/customers/:id/follower' => 'customers#follower'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    resources :photos do
      resources :favorites, only: [:create, :destroy]
    end
  end
  #管理者側
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    get '/' => 'homes#top'
  end
end
