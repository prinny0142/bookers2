Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'home/about' => 'home#about'
  get 'search' => 'search#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :create, :update] do
    member do
      get :follows
      get :followers
    end
    resource :relationships, only:[:create, :destroy]
  end
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
