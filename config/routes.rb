Rails.application.routes.draw do
  root 'welcome#index'
  get '/sign_up', to: 'welcome#new', as: 'sign_up'

  devise_for :applicant
  devise_for :business

  namespace :applicant do
    root 'welcome#index'
  end

  namespace :business do
    root 'welcome#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
