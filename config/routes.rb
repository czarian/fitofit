Rails.application.routes.draw do
  devise_for :users
  resources :activities, except: [:update]

  root to: 'activities#index'

  get '*path' => redirect('/')

end
