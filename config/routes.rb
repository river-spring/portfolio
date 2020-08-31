Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  root to: 'homes#top'
  get 'search' => "searchs#search"
  namespace :users do
    get 'users/quit' => "users#quit"
    patch 'users/quit_update' => "users#quit_update"
    resources :users, only: [ :show, :edit, :update, :destroy] do
      resources :friends, only: [ :index, :create, :update, :destroy]
    end
    resources :shelves, only: [ :show, :new, :create, :edit, :update, :destroy] do
      resources :productions, only: [ :show, :new, :create, :destroy] do
         collection do
          get :search
         end
        resources :comments, only: [ :create, :destroy]
      end
    end
    resources :groups, only: [ :index, :new, :create, :edit, :update, :destroy]
    resources :recommendations, only: [ :show, :new, :create, :destroy]
  end
  namespace :admins do
    resources :users, only: [ :index, :show, :edit, :update]
    resource :groups, only: [ :index]
    resource :shelves, only: [ :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
