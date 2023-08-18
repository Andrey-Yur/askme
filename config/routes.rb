Rails.application.routes.draw do
  # root to: "questions#index"
  root to: "sessions#new"
  resources :questions
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update destroy]
end
