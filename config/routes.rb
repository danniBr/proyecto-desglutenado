Rails.application.routes.draw do
  resources :recipes
  resources :questions do
    resources :comments
  end
  devise_for :users, controllers: {
      registrations: 'users/registrations'
   }
  get 'pages/index'
  delete 'questions/:question_id/comments/:id', to: 'comments#destroy', as: 'delete_comment'
  
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
