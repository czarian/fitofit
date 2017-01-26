Rails.application.routes.draw do
  get 'activities/index'

  get 'activities/new'

  get 'activities/create'

  get 'activities/delete'

  resources :activities, except: [:update]
end
