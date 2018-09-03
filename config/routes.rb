Rails.application.routes.draw do
  devise_for :users
  # get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :services do
    member do
      get 'sub_services' 
    end
  end

  resource :addresses do
    member do
      get 'get_states_and_cities'
    end
  end

  resources :service_requests
  

    #custom routes for user login and logout
  devise_scope :user do
  	post 'login', to: 'users/sessions#create'
  	delete 'logout', to: 'users/sessions#destroy'
    get  'sign_up',  to: 'users/registrations#new'
    post  'create_user',  to: 'users/registrations#create'
	end
  namespace :admin do
    root to: "dashboard#index"
    resources :services do
      member do
        get 'sub_services' 
      end
    end
  end

  
  namespace :partner do
    resource :portfolio do
      collection do
        get 'get_subservices'
      end
    end
    resources :dashboard, only: [:index] do
      collection do
        put "accept_reject"
      end
    end
  end



  #Singular routes for few methods
	get 'dashboard', to: 'home#dashboard'
  get 'get_services', to: 'service_requests#get_services'

end
