Rails.application.routes.draw do
  namespace :api, format: :json do
    get 'user/info', to: 'user#show', as: :user_info
    resources :sessions, only: [:create]
    
    namespace :user do
      resources :deposits, only: [:create]
      resources :withdraws, only: [:create]
      resources :transfers, only: [:create]
    end

    namespace :teams, path: 'teams/:team_id' do
      resources :deposits, only: [:create]
      resources :withdraws, only: [:create]
      resources :transfers, only: [:create]

      get 'info', to: 'info#show', as: :team_info
    end
  end
end
