Rails.application.routes.draw do
  root 'static_pages#home'

  get 'sessions/new'
  get '/signup', to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :subjects
  resources :users

  get '/concepts', to: 'concepts#index',
      as: 'concept'
  get '/subject/:id/concept/new', to: 'concepts#new',
      as: 'subject_concept_new'
  get '/subject/:id/concept/:id_concept/edit', to: 'concepts#edit',
      as: 'concept_edit'

  get '/records', to: 'records#index',
      as: 'record'

  post "/concepts" => "concepts#create"
  patch "/concepts.:id_concept" => "concepts#update"
  delete "/concepts.:id_concept" => "concepts#destroy"
end
