Rails.application.routes.draw do
  resources :activities, except: [:update]

  root to: 'activities#index'

end
