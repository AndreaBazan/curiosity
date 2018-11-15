Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :games, only: %i[show] do
    resources :levels, only: %i[] do
      member do
        get :play
      end
    end
  end

  resources :levels, only: %i[] do
    resources :play_sessions, only: %i[create]
  end

  get 'users/dashboard' => 'users#dashboard', as: :user_root # creates user_root_path
end
