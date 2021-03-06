Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'locations/findaddress', to: 'locations#findaddress'

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :recipes do
    resources :likes
  end

  resources :locations
  resources :questions do
    resources :comments
  end

  delete 'questions/:question_id/comments/:id', to: 'comments#destroy', as: 'delete_comment'

  get 'pages/index'

  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
