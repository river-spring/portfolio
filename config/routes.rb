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
  get 'admin_search' => "searchs#admin_search"
  namespace :users do
    get 'users/quit' => "users#quit"
    patch 'users/quit_update' => "users#quit_update"
    resources :users, only: [ :show, :edit, :update, :destroy] do
      resources :friends, only: [ :index, :create, :update, :destroy]
      resources :recommendations, only: [ :show, :new, :create, :update, :destroy]
      collection do
          get :history
          get :edit_password
          patch :password_update
      end
    end
    resources :shelves, only: [ :show, :new, :create, :edit, :update, :destroy] do
      resources :productions, only: [ :show, :new, :create, :destroy] do
         collection do
          get :search
         end
        resources :comments, only: [ :create, :destroy]
      end
    end
    resources :groups
  end
  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
    resources :groups, only: [:index, :show]
    resources :shelves, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
