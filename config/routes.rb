Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/professors', to: 'professor#index'
  get '/professors/:id', to: 'professor#show'

  get '/students', to: 'student#index'
end
