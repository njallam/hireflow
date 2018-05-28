Rails.application.routes.draw do
  root 'welcome#index'
  get '/sign_up', to: 'welcome#new', as: 'sign_up'

  devise_for :applicants
  devise_for :businesses

  get '/applicant', to: 'business#index', as: 'applicant_root'
  get '/business', to: 'applicant#index', as: 'business_root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
