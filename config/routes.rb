Rails.application.routes.draw do
  
  resources :tasks
  root 'tasks#index'
  patch '/tasks/:id/toggle_status', to: 'tasks#toggle_status', as: :toggle_status_task
  
  resources :users 
  get  '/signup',  to: 'users#new'
  
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end


