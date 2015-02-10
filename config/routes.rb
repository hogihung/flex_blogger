Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  resources :posts
  resources :categories
  resources :users
	resources :home,    only: :index
	resources :contact, only: :index
  resources :about,   only: :index

  root to: "home#index"

  # this is a work-around for sign_out no route issue
  get "log_out", to: "clearance/sessions#destroy"
end
