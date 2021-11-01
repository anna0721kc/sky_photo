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
    get '/about' => 'homes#about'
    get '/customers/:id/follow' => 'customers#follow'
    get '/customers/:id/follower' => 'customers#follower'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    # get '/customers/edit' => 'customers#edit'
    # patch '/customers/edit' => 'customers#update'
    post '/favorites' => 'favorites#create'
    get '/favorites' => 'favorites#index'
    delete '/favorites/:id' => 'favorites#destroy'
    get '/customers/:id' => 'customers#show',as: 'customer'
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    get '/' => 'homes#top'
  end
end
