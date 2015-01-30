Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  resources :categories
	resources :home,    only: :index
	resources :contact, only: :index
  resources :about,   only: :index

  root to: 'home#index'
end
