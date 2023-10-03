Rails.application.routes.draw do
  namespace :api, format: :json do
    resources :sessions, only: [:create]
  end
end
