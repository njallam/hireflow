Rails.application.routes.draw do
  get 'applicants/index'
  root 'welcome#index'
  get '/sign_up', to: 'welcome#new', as: 'sign_up'

  devise_for :applicants
  devise_for :businesses

  get '/applicant', to: 'applicants#index', as: 'applicants_root'
  get '/business', to: 'businesses#index', as: 'businesses_root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
