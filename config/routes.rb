Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    resources :messages, only: [:index, :new, :create]
  end

  # prevents password to show in address bar
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  namespace :api do
	   namespace :v1 do
		  # /api/v1/questions.json # => INDEX
      # /api/v1/questions/1.json # => SHOW
  		resources :sessions, only: [:create] do
        delete :destroy, on: :collection
      end

      resources :users, only: [:create, :index] do
        resources :messages, only: [:new, :create]
        resources :splitter, only: [:create, :index]
      end
    end
  end

  resources :charges

  root 'dashboard#index'
end
