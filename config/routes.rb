Rails.application.routes.draw do
  get 'levels/play'
  devise_for :users
  root to: 'pages#home'
  # get 'user/dashboard'

  resources :games, only: %i[show] do
    resources :levels, only: %i[] do
      member do
        get :play
      end
    end
  end

  get 'users/dashboard' => 'users#dashboard', as: :user_root # creates user_root_path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
