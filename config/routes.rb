Rails.application.routes.draw do
  devise_for :users
  # get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  # resources :sub_services
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

	get '/dashboard', to: 'home#dashboard'


end
