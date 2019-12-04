Rails.application.routes.draw do
  get 'quiz/show'
  devise_for :users
  root to: 'pages#home'

  #resources :user_words, only: [:index, :show]

  resources :languages, only: [:index, :show]

  resources :user_languages do
    collection do
      post :update_languages
    end
  end

  resources :words, only: [] do
    resources :user_words, only: [:index, :new, :create]
  end

  resources :quizzes, only: [:show, :create] do
    collection do
      get :starter
    end
    member do
      get :questions
      post :answer
    end
  end
  
  get '/search', to: 'user_words#search'
end
