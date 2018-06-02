Rails.application.routes.draw do
  root 'welcome#index'
  get '/sign_up', to: 'welcome#new', as: 'sign_up'

  devise_for :applicant
  devise_for :business

  resources :jobs
  post '/jobs/:id/apply', to: 'applications#create', as: 'apply_job'
  resources :applications, only: %i[show]

  scope :applicant do
    resource :profile, controller: 'applicants', as: 'applicant_profile', only: %i[edit update]
  end

  scope :business do
    resource :profile, controller: 'businesses', as: 'business_profile', only: %i[edit update]
  end
end
