Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'user/dashboard'
  get 'play_session/new'
  get 'play_session/create'
  get 'games/show'
  get 'users/dashboard' => 'users#dashboard', as: :user_root # creates user_root_path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
