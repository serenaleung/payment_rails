Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  # prevents password to show in address bar
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  namespace :api do
	namespace :v1 do
		# /api/v1/questions.json # => INDEX
      # /api/v1/questions/1.json # => SHOW
		resources :sessions, only: [:create]
    resources :users, only: [:create, :index]
  	end
  end

  resources :charges

  root 'dashboard#index'
end
