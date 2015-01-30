Rails.application.routes.draw do
  resources :posts
  resources :categories
	resources :home,    only: :index
	resources :contact, only: :index
  resources :about,   only: :index

<<<<<<< HEAD
  root to: 'home#index'
=======
  root to: 'categories#new'

  get 'log_out', to: 'clearance/sessions#destroy' # this is a work-around for sign_out no route issue
>>>>>>> add_clearance
end
