Rails.application.routes.draw do
  resources :employees, only: %i[index show]
  root 'employees#index'
end
