Rails.application.routes.draw do
  root 'welcome#index'
  get '/sign_up', to: 'welcome#new', as: 'sign_up'

  devise_for :applicant
  devise_for :business

  resources :jobs

  get '/profile', to: 'welcome#edit', as: 'edit_profile'
  patch '/profile', to: 'welcome#update'
end
