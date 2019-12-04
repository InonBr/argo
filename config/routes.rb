Rails.application.routes.draw do
  get 'quiz/show'
  devise_for :users
  root to: 'pages#home'

  resources :languages, only: [:index, :show]

  resources :user_languages do
    collection do
      post :update_languages
    end
  end

  resources :words, only: [] do
    resources :user_words, only: [:new, :create]
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
end
