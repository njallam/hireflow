Rails.application.routes.draw do
  root 'welcome#index'
  get '/sign_up', to: 'welcome#new', as: 'sign_up'

  devise_for :applicant
  devise_for :business

  resources :jobs do
    post 'apply', on: :member, to: 'applications#create'
  end
  resources :applications, only: %i[show index update] do
    patch 'confirm', on: :member
    patch 'accept', on: :member
    patch 'reject', on: :member
  end

  scope :applicant do
    resource :profile, controller: 'applicants', as: 'applicant_profile', only: %i[edit update] do
      resources :achievements, only: %i[new create edit update destroy]
      resources :experiences, only: %i[new create edit update destroy]
    end
  end

  scope :business do
    resource :profile, controller: 'businesses', as: 'business_profile', only: %i[edit update]
  end
end
