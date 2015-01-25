Rails.application.routes.draw do
  resources :categories
	resources :contact, :only => [:index]
  resources :about, :only => [:index]

  root to: 'categories#new'
end
