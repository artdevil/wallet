Rails.application.routes.draw do
  namespace :api, format: :json do
    get 'users/info', to: 'users#show', as: :user_info
    resources :sessions, only: [:create]
  end
end
