Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users,
               controllers: {
                   sessions: 'users/sessions',
                   registrations: 'users/registrations'
               }
    get '/member-data', to: 'members#show'
  end
  
  post 'users/:user_id/posts/:id/create_comment', to: 'comments#create', as: 'create_comment'
  post 'users/:user_id/posts/:id/create_like', to: 'likes#create', as: 'like_comment'
  delete 'users/:user_id/posts/:post_id/delete_comment/:id', to: 'comments#delete', as: 'delete_comment' 

  resources :users, only: [:index, :show] do
    resources :posts
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show], defaults: {format: :json} do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end

  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
