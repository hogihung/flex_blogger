Rails.application.routes.draw do
  resources :categories
	resources :contact, :only => [:index]
  root to: 'categories#new'
end
