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

  get 'users/dashboard' => 'users#dashboard', as: :user_root # creates user_root_path
end
