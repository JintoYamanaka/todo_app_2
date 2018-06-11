Rails.application.routes.draw do
  resources :tasks
  root 'tasks#index'
  patch '/tasks/:id/toggle_status', to: 'tasks#toggle_status', as: :toggle_status_task
end


