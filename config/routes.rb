AliceInKorea::Application.routes.draw do
  
  root to: 'events#index'
  
  devise_for :users, controllers: { sessions: 'users/sessions' }, only: :sessions
  
  devise_scope :user do
    get '/admin_login', to: 'users/sessions#new', as: 'admin_login'
  end

  resources :events do
    resources :requests
  end
  
  get '/admin_new_event', to: 'events#new', as: 'admin_new_event'
  get '/admin_event_image_cache', to: 'events#image_cache', as: 'admin_event_image_cache', requirements: { cache_id: /\d{8}-\d{4}-\d{5}-\d{4}/, filename: /[a-zA-Z0-9_ ]+\.(jpg|jpeg|png|gif){1}/i } 
  get '/admin_preview_event/:id', to: 'events#preview', as: 'admin_preview_event'
  post '/admin_open_event/:id', to: 'events#open', as: 'admin_open_event'

  get '/get_request_form/:id', to: 'requests#get_form', as: 'get_request_form'
  
end
