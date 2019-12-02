Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :languages, only: [:index, :show]

  resources :user_languages do
    collection do
      post :update_languages
    end
  end
end
