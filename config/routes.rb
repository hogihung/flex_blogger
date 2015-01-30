Rails.application.routes.draw do
  resources :posts
  resources :categories
	resources :home,    only: :index
	resources :contact, only: :index
  resources :about,   only: :index

  root to: 'categories#new'
end
