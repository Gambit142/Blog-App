Rails.application.routes.draw do
  get 'posts/index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
