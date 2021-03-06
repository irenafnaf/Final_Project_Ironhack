Rails.application.routes.draw do

	root :to => redirect('users/1')
  
  resources :users, only: [:show]
  resources :projects, only: [:index, :show], controller: "project_views"

  get '/clients/:client_id' => "client_views#client_home"
  
  scope '/api' do
  	resources :clients, only: [:index] do
  		resources :projects, except: [:new, :edit] 
  	end

  	resources :projects do 
  		resources :thumbnails
  	end
  end

  get '/api/types' => "types#index"
  get '/api/projects/:project_id/types' => "project_types#index"

scope '/api' do
  resources :comments, only: [:index, :create, :destroy]
  end 


  
end
