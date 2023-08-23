Rails.application.routes.draw do
  # root to: "questions#index"
  root to: "sessions#new"
  # resources :answers
  resources :questions do
    resource :answers
  end
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update destroy]
end
