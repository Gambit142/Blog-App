Rails.application.routes.draw do
  post 'users/:user_id/posts/:id/create', to: 'comments#create', as: 'create_comment'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
