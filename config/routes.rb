AliceInKorea::Application.routes.draw do
  
  root to: 'events#index'
  
  devise_for :users, controllers: { sessions: 'users/sessions' }, only: :sessions
  
  devise_scope :user do
    get '/admin_login', to: 'users/sessions#new', as: 'admin_login'
  end

  resources :events do
    resources :requests
  end
  
  get '/admin', to: 'admin#index', as: 'admin'
  
  get '/admin_events', to: 'admin#events', as: 'admin_events'
  get '/admin_new_event', to: 'admin#new_event', as: 'admin_new_event'
  post '/admin_create_event', to: 'admin#create_event', as: 'admin_create_event'
  get '/admin_event_image_cache', to: 'admin#event_image_cache', as: 'admin_event_image_cache', requirements: { cache_id: /\d{8}-\d{4}-\d{5}-\d{4}/, filename: /[a-zA-Z0-9_ ]+\.(jpg|jpeg|png|gif){1}/i } 
  get '/admin_preview_event/:id', to: 'admin#preview_event', as: 'admin_preview_event'
  post '/admin_change_event_status/:id', to: 'admin#change_event_status', as: 'admin_change_event_status', requirements: { status: /(\d+)/ }
  post '/admin_change_request_status/:id', to: 'admin#change_request_status', as: 'admin_change_request_status', requirements: { status: /(\d+)/ }
  
  get '/admin_requests', to: 'admin#requests', as: 'admin_requests'
  
  
  get '/get_request_form/:id', to: 'requests#get_form', as: 'get_request_form'
  
end
