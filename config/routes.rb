Rails.application.routes.draw do
  devise_for :users
  # get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :services do
    member do
      get 'sub_services' 
      get 'create_sub_services'
    end
  end

  resources :addresses 
  resources :feedbacks

  resources :service_requests do
    member do
      patch 'cancel_service_request'
    end
  end
  

    #custom routes for user login and logout
  devise_scope :user do
  	post 'login', to: 'users/sessions#create'
  	delete 'logout', to: 'users/sessions#destroy'
    get  'sign_up',  to: 'users/registrations#new'
    post  'create_user',  to: 'users/registrations#create'
    post  'send_password_instructions',  to: 'users/passwords#create'
    put  'change_password',  to: 'users/passwords#update'
    get  'partner/invite_employee',  to: 'users/invitations#new'
    post  'send_invitation',  to: 'users/invitations#create'
    put  'update_employee_detail',  to: 'users/invitations#update'
    get  'accept_invitation',  to: 'users/invitations#edit'
	end
  #custom routes for admin 
  namespace :admin do
    root to: "dashboard#index"
    resources :services do
      member do
        get 'sub_services'
        get 'create_sub_services'
        get 'edit_sub_services'
        put 'update_sub_services'
      end
    end
    resources :users do
      member do
        get 'user_service_request'
        get 'update_service_status'
        put 'manage_portfolio_status'

      end
    end
  end

  namespace :partner do
    resource :portfolio do
      collection do
        get 'get_subservices'
        get 'get_city_service_list'
        post 'upload_photos'
      end
    end
    resources :dashboard, only: [:index] do
      collection do
        put "accept_reject"
        get "manage_employees"
      end
    end
    resources :users
  end




  #Singular routes for few methods
  get 'get_services_by_city', to: 'home#get_services_by_city'
	get 'dashboard', to: 'home#dashboard'
  get 'get_services', to: 'service_requests#get_services'
  get 'get_states_and_cities', to: 'addresses#get_states_and_cities'
  get 'admin/partners', :to => 'admin/users#partners'
  get 'admin/partners/:id/partner_service_request', :to => 'admin/users#partner_service_request', :as => 'partner_service_request'
  get 'admin/partner/:id', :to => 'admin/users#partner_details', :as => 'partner_details'
  get 'admin/service-requests', :to => 'admin/users#service_requests_list', :as => 'service_requests_list'


end
