Rails.application.routes.draw do
  resources :categories
	resources :home, :only => [:index]
	resources :contact, :only => [:index]
  resources :about, :only => [:index]

  root to: 'categories#new'

  get 'log_out', to: 'clearance/sessions#destroy' # this is a work-around for sign_out no route issue
end
