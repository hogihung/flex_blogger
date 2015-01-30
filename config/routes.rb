Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  resources :categories
	resources :home,    only: :index
	resources :contact, only: :index
  resources :about,   only: :index

  root to: 'home#index'

  get 'log_out', to: 'clearance/sessions#destroy' # this is a work-around for sign_out no route issue
end
