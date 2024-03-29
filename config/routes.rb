Rails.application.routes.draw do
  get '/sign_up', to: 'welcome#new', as: 'sign_up'

  devise_for :applicant
  devise_for :business

  authenticated :applicant do
    root to: 'jobs#index'
  end
  authenticated :business do
    root to: 'jobs#index'
  end
  root 'welcome#index'

  resources :jobs do
    post 'apply', on: :member, to: 'applications#create'
    patch 'close', on: :member
    patch 'open', on: :member
  end
  resources :applications, only: %i[show index update] do
    patch 'confirm', on: :member
    patch 'accept', on: :member
    patch 'reject', on: :member
  end

  scope :applicant do
    resource :profile, controller: 'applicants', as: 'applicant_profile', only: %i[edit update] do
      resources :achievements, except: %i[index show]
      resources :experiences, except: %i[index show]
      resources :educations, except: %i[index show] do
        resources :subjects, except: %i[index show]
      end
    end
  end

  scope :business do
    resource :profile, controller: 'businesses', as: 'business_profile', only: %i[edit update]
  end

  unless Rails.env.development?
    match '*path', to: redirect('/'), via: :all, constraints: lambda { |req|
      req.path.exclude? 'rails/active_storage'
    }
  end
end
