Rails.application.routes.draw do
  resources :tasks
  root 'tasks#index'
  patch '/tasks/:id/edit', to: 'tasks#toggle_status'
end


