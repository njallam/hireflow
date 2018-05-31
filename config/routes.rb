Rails.application.routes.draw do
  root 'welcome#index'
  get '/sign_up', to: 'welcome#new', as: 'sign_up'

  devise_for :applicant
  namespace :applicant do
    root 'welcome#index'
    get '/profile', to: 'welcome#edit', as: 'edit_profile'
    patch '/profile', to: 'welcome#update'
    resources :jobs, only: %i[index show]
  end

  devise_for :business
  namespace :business do
    root 'welcome#index'
    get '/profile', to: 'welcome#edit', as: 'edit_profile'
    patch '/profile', to: 'welcome#update'
    resources :jobs
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
