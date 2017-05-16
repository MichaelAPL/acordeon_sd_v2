Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'subjects#index'

  resources :subjects

  get '/concepts', to: 'concepts#index',
      as: 'concept'
  get '/subject/:id/concept/new', to: 'concepts#new',
      as: 'subject_concept_new'
  get '/subject/:id/concept/:id_concept/edit', to: 'concepts#edit',
      as: 'concept_edit'

  post "/concepts" => "concepts#create"
  patch "/concepts.:id" => "concepts#update"
end
