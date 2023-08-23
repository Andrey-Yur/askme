Rails.application.routes.draw do
  root to: "sessions#new"
  resources :questions do
    resource :answers
  end
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update destroy]
end
