Rails.application.routes.draw do
  
# get 'cuisine_types' => 'cuisine_types#index'
# get 'cuisine_type/:id' => 'cuisine_types#show_by_id'
# get 'reservations/show'=>'reservations#show'
# get 'restaurants/:id' => 'restaurants#show'


#resources :cuisine_types, only: [:index, :show]
resources :cuisine_types 
resources :restaurants do
	resources :reservations
end

resources :users, only: [:new, :create]

#resources :sessions, only: []
# get '/login' => 'sessions#new', as: :login
# post '/login' => 'sessions#create', as: :post_login



end
